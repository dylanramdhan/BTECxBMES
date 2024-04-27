import SwiftUI
import Combine

struct AccountView: View {
    @State private var progressValue: Double = 0.0
    @State private var progressCompleted = false
    @State private var fetchedData: String = ""
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        GeometryReader { geometry in
            VStack {
                ProgressBar(progress: self.$progressValue)
                    .frame(width: geometry.size.width - 40, height: 20)
                    .padding()
                    .onReceive(timer) { _ in
                        if self.progressValue < 1.0 {
                            self.progressValue += 0.01 // Increment progress for 20 seconds
                        } else {
                            self.timer.upstream.connect().cancel()
                            self.progressCompleted = true
                            fetchDataFromServer()
                        }
                    }

                if progressCompleted {
                    if !fetchedData.isEmpty {
                        Text("Fetched data: \n\(fetchedData)")
                            .font(.headline)
                            .foregroundColor(.green)
                    } else {
                        Text("Fetching data...")
                            .font(.headline)
                            .foregroundColor(.orange)
                    }
                }
            }
            .navigationBarTitle("Progress")
        }
    }
    
    func fetchDataFromServer() {
        guard let url = URL(string: "http://192.168.1.137:3001/") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let responseString = String(data: data, encoding: .utf8) {
                    DispatchQueue.main.async {
                        self.fetchedData = responseString
                    }
                }
            }
        }.resume()
    }
}

struct ProgressBar: View {
    @Binding var progress: Double

    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle().frame(width: nil, height: 20)
                .opacity(0.3)
                .foregroundColor(Color.gray)

            Rectangle().frame(width: CGFloat(self.progress) * UIScreen.main.bounds.width, height: 20)
                .foregroundColor(Color.blue)
                .animation(.linear, value: progress)
        }
        .cornerRadius(45.0)
    }
}
