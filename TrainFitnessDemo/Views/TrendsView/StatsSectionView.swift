//
//  StatsSectionView.swift
//  TrainFitnessDemo
//
//  Created by David Hull on 2025-01-23.
//

import SwiftUI

struct StatsSectionView: View {
    var body: some View {
        VStack {
            HeaderView(title: "Stats")
            StatsSectionEmptyState()
        }
        .padding(.horizontal)
        .padding(.top)
    }
}

#Preview {
    ScrollView {
        StatsSectionView()
    }
}

struct StatsSectionEmptyState: View {
    var body: some View {
        HStack {
            InfoCardView(iconName: "dumbbell.fill", title: "Workouts", value: "0")
            InfoCardView(iconName: "bolt.fill", title: "Time Logged", value: "0m")
        }
        HStack {
            InfoCardView(iconName: "flame.fill", title: "Calories", value: "0")
            InfoCardView(iconName: "arrow.2.squarepath", title: "Reps", value: "0")
        }
        InfoCardView(iconName: "scalemass.fill", title: "Volume Lifted", value: "0 lbs")
    }
}

struct InfoCardView: View {
    var iconName: String
    var title: String
    var value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 0) {
                Image(systemName: iconName)
                    .bold()
                    .font(.footnote)
                    .foregroundColor(Color.gold)
                    .imageScale(.small)
                Text(" \(title)")
                    .font(.footnote)
                    .foregroundColor(Color.gold)
                    .fontWeight(.semibold)
            }
            HStack {
                Text(value)
                    .fontWeight(.semibold)
                    .font(.system(.title, design: .rounded))
                Spacer()
            }
        }
        .padding(12)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color.gold.opacity(0.08))
        }
    }
}
