//
//  TrackerApp.swift
//  Tracker
//
//  Created by Dmitriy Rysev on 10.11.2022.
//

import SwiftUI

@main
struct TrackerApp: App {
    @StateObject var locations = Locations()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    ContentView(location: locations.primary)
                }
                .tabItem {
                    Label("Discover", systemImage: "airplane.circle.fill")
                    //Image(systemName: "airplane.circle.fill")
                    //Text("Discover")
                }
                
                NavigationView {
                    WorldView()
                }
                .tabItem {
                    Label("Locations", systemImage: "star.fill")
                }
                
                NavigationView {
                    TipsView()
                }
                .tabItem {
                    Label("Tips", systemImage: "list.bullet")
                }
            }
            .environmentObject(locations)
        }
    }
}
