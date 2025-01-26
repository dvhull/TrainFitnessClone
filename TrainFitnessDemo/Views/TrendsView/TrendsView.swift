//
//  TrendsView.swift
//  TrainFitnessDemo
//
//  Created by David Hull on 2025-01-23.
//

import SwiftUI

struct TrendsView: View {
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                ProgressSectionView()
                    .padding(.bottom)
                StatsSectionView()
                    .padding(.bottom)
                MusclesSectionView()
                    .padding(.bottom)
            }
            .navigationTitle("Trends")
            .background(Color.background)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // Dummy button does nothing.
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
        }
    }
}

#Preview {
    TrendsView()
}
