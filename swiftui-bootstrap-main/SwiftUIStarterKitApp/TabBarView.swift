//
//  TabBarView.swift
//  SwiftUIStarterKitApp
//
//  Created by Osama Naeem on 02/08/2019.
//  Copyright © 2019 NexThings. All rights reserved.
//

import SwiftUI

struct TabbarView: View {
    var body: some View {
        TabView {
            NavigationView {
                            SimpleContentView()
                        }
                        .tag(0)
                        .tabItem {
                            Image("profile-glyph-icon")
                                .resizable()
                            Text("Eye Health")
                        }

            NavigationView {
                     AccountView()
                  }
                   .tag(1)
                    .tabItem {
                    Image("activity-1")
                    Text("Check Reading")
                }
        }
    }
}



