//
//  ContentView.swift
//  TrainFitnessDemo
//
//  Created by David Hull on 2025-01-23.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .trends
    enum Tab {
        case feed
        case explore
        case workout
        case trends
        case you
    }
    
    var body: some View {
        TabView(selection: $selection) {
            Text("Feed Page")
                .tabItem {
                    Label("Feed", systemImage: "doc.text.image.fill")
                        .imageScale(.small)
                        .environment(\.symbolVariants, .none)
                }
                .tag(Tab.feed)
            Text("Explore Page")
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                        .imageScale(.small)
                        .environment(\.symbolVariants, .none)
                }
                .tag(Tab.explore)
            Text("Workout Page")
                .tabItem {
                    Label("Workout", systemImage: "dumbbell.fill")
                        .imageScale(.small)
                        .environment(\.symbolVariants, .none)
                }
                .tag(Tab.workout)
            TrendsView()
                .tabItem {
                    Label("Trends", systemImage: "chart.bar.xaxis.ascending")
                        .imageScale(.small)
                        .environment(\.symbolVariants, .none)
                }
                .tag(Tab.trends)
            Text("You Page")
                .tabItem {
                    Label("You", systemImage: "person.circle.fill")
                        .imageScale(.small)
                        .environment(\.symbolVariants, .none)
                }
                .tag(Tab.you)
        }
    }
}

#Preview {
    ContentView()
}
