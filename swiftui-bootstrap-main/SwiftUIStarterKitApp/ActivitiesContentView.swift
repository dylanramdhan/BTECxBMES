import SwiftUI

struct SimpleStory: Identifiable {
    let id = UUID()
    var title: String
    var content: String
}

struct SimpleStoryView: View {
    var story: SimpleStory
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(story.title)
                .font(.headline)
            Text(story.content)
                .font(.subheadline)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SimpleContentView: View {
    let stories: [SimpleStory] = [
        SimpleStory(title: "The Importance of Regular Eye Examinations", content: "Regular eye examinations are crucial for maintaining good eye health and vision. These exams allow for the early detection and treatment of conditions like glaucoma, cataracts, and macular degeneration, which might otherwise lead to vision impairment or loss. During an eye exam, an optometrist or ophthalmologist will not only determine your need for corrective lenses but also check for signs of diseases that could affect your overall eye health."),
        SimpleStory(title: "Impact of Digital Screens on Eye Health", content: "With the increase in screen time, whether it be computers, smartphones, or tablets, digital eye strain has become a common issue. Symptoms include dryness, irritation, blurred vision, and headaches. This strain is often due to poor lighting, screen glare, and viewing screens at inappropriate distances. Recommendations to reduce digital eye strain include following the 20-20-20 rule (every 20 minutes, look at something 20 feet away for at least 20 seconds), ensuring proper lighting, and possibly using computer glasses designed to block blue light."),
        SimpleStory(title: "Diet and Eye Health", content: "Nutrition plays a critical role in eye health. Certain nutrients can help prevent or slow the progression of chronic eye diseases. For example, antioxidants like lutein and zeaxanthin, which are found in green leafy vegetables and eggs, can help protect against cataracts and macular degeneration. Omega-3 fatty acids, found in fish like salmon and sardines, are important for maintaining cell health in the eyes and might help manage dry eye syndrome.")
    ]
    
    var body: some View {
        NavigationView {
            List(stories) { story in
                SimpleStoryView(story: story)
            }
            .navigationBarTitle("Health Tips For Your Eyes")
        }
    }
}



// Entry point of the app remains unchanged, assuming you have your App and SceneDelegate properly set up
// for earlier versions of iOS (before 14).
