//
//  TrainFitnessDemoApp.swift
//  TrainFitnessDemo
//
//  Created by David Hull on 2025-01-23.
//

import SwiftUI

@main
struct TrainFitnessDemoApp: App {
    init() {
        // Make it so the TabBar is always visible with default behaviour (blur).
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
            
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
        UITabBar.appearance().standardAppearance = appearance
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
