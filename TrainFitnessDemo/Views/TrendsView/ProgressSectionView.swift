//
//  ProgressSectionView.swift
//  TrainFitnessDemo
//
//  Created by David Hull on 2025-01-23.
//

import SwiftUI
import Charts

enum ProgressSection {
    case time
    case volume
    case sets
    case calories
}

struct ProgressSectionView: View {
    @State private var selection: ProgressSection = .time
    
    var body: some View {
        VStack {
            HeaderView(title: "Progress")
                .padding(.top, 3)
            ProgressSectionEmptyState(selection: $selection)
        }
        .padding([.top, .horizontal])
    }
}

#Preview {
    ScrollView {
        ProgressSectionView()
    }
}

// TODO: Inconsistent naming conventions. 
struct ProgressSectionEmptyState: View {
    @Binding var selection: ProgressSection
    var body: some View {
        VStack {
            GraphHeader(selection: $selection)
            EmptyGraphView()
                .padding(.top, 8)
            GraphPicker(selection: $selection)
        }
        .padding(20)
        .background {
            RoundedRectangle(cornerRadius: 20.0)
                .foregroundColor(.white)
        }
    }
}

private struct GraphHeader: View {
    @Binding var selection: ProgressSection
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Total Time")
                    .fontWeight(.medium)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                Text("0 ")
                    .font(.system(.title2, design: .rounded))
                    .bold()
                // TODO: this should animate and change when on selection is changed.
                + Text("hr")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.gold)
                    .font(.callout)
                Text("Jan 17 - Jan 23")
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                    .font(.footnote)
            }
            Spacer()
        }
    }
}

struct EmptyGraphView: View {
    var body: some View {
        ZStack {
            Chart {
                BarMark(
                    x: .value("Category", "Fri"),
                    y: .value("Value", 0.0)
                )
                BarMark(
                    x: .value("Category", "Sun"),
                    y: .value("Value", 0.0)
                )
                BarMark(
                    x: .value("Category", "Tues"),
                    y: .value("Value", 0.0)
                )
                BarMark(
                    x: .value("Category", "Thurs"),
                    y: .value("Value", 0.0)
                )
            }
            .frame(height: 174)
            // TODO: Figure out how to align it as leading without truncation.
            // .chartXAxis(position: .bottom) ...
            
            VStack {
                Spacer()
                NoGraphMessage
                Spacer()
                // Add some empty space to push the message up.
                EmptySpace
            }
            .frame(height: 174)
        }
    }
    
    var NoGraphMessage: some View {
        VStack {
            VStack {
                Text("No Data")
                    .fontWeight(.semibold)
                    .padding(.bottom, 5)
                Text("Please try a different date range or filter.")
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
        }
        .padding(12)
        .background {
            RoundedRectangle(cornerRadius: 10.0)
                .foregroundColor(Color.secondaryButton)
        }
    }
    
    var EmptySpace: some View {
        Text("Empty Space")
            .padding(.top, 3)
            .font(.caption)
            .hidden()
    }
}

private struct GraphPicker: View {
    @Binding var selection: ProgressSection
    
    var body: some View {
        HStack(spacing: 8) {
            CustomSelectableButton(
                title: "Time",
                isSelected: selection == .time
            ) {
                selection = .time
            }
            CustomSelectableButton(
                title: "Volume",
                isSelected: selection == .volume
            ) {
                selection = .volume
            }
            CustomSelectableButton(
                title: "Sets",
                isSelected: selection == .sets
            ) {
                selection = .sets
            }
            CustomSelectableButton(
                title: "Calories",
                isSelected: selection == .calories
            ) {
                selection = .calories
            }
        }
        .padding(.top)
    }
}
