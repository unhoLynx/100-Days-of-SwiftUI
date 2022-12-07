//
//  ProvingGroundsApp.swift
//  ProvingGrounds
//
//  Created by Dmitriy Rysev on 27.11.2022.
//

import SwiftUI

@main
struct ProvingGroundsApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Image(systemName: "airplane.circle.fill")
                        Text("Discover")
                    }
                ContentView()
                    .tabItem {
                        Image(systemName: "airplane.circle.fill")
                        Text("Discover2")
                    }
                ContentView()
                    .tabItem {
                        Image(systemName: "airplane.circle.fill")
                        Text("Discover3")
                    }
            }
        }
    }
}
