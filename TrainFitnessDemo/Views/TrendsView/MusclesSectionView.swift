//
//  MusclesSectionView.swift
//  TrainFitnessDemo
//
//  Created by David Hull on 2025-01-23.
//

import SwiftUI

struct MusclesSectionView: View {
    // TODO: Maybe make this an enum hardcoding a string seems bad here.
    @State private var metric = "Reps"
    
    var body: some View {
        VStack {
            HeaderView(title: "Muscle Groups")
            MusclesSectionEmptyState(metric: $metric)
        }
        .padding(.horizontal)
        .padding(.vertical)
        .padding(.bottom, 30)
    }
}

#Preview {
    ScrollView {
        MusclesSectionView()
    }
}

struct MusclesSectionEmptyState: View {
    var metrics = ["Reps", "Sets", "Volume"]
    @Binding var metric: String
    
    var body: some View {
        // Metrics Picker
        Picker("", selection: $metric) {
            ForEach(metrics, id: \.self) {
                Text($0)
            }
        }
        .pickerStyle(.segmented)
        
        VStack {
            emptyRangeMessage
        }
        .frame(width: 240, height: 240)
        .background {
            ConcentricCirclesWithLines()
        }
        .padding(.vertical)
        .padding(.vertical)
        .padding(.vertical)
        .padding(.vertical)
        
        GlobalRankingsView()
    }
    
    var emptyRangeMessage: some View {
        VStack(spacing: 10) {
            Text("No Data")
                .fontWeight(.semibold)
            // .padding(.bottom, )
            Text("Please try a different date\nrange filter.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(12)
        .background {
            RoundedRectangle(cornerRadius: 10.0)
                .foregroundColor(Color.ternaryButton)
        }
    }
}

// TODO: This won't fit into the container. In the future we need to fit the labels inside the GeometryReader frame.
struct ConcentricCirclesWithLines: View {
    var body: some View {
        GeometryReader { geom in
            let center = CGPoint(x: geom.size.width / 2, y: geom.size.height / 2)
            let outerRadius = min(geom.size.width, geom.size.height) / 2 // Ensure it fits within the view
            let spacing = outerRadius / 4 // Equal spacing for 4 circles
            let labels = ["0", "0", "0", "0", "0", "0"] // Values for the circle
            let titles = ["Core", "Arms", "Chest", "Legs", "Back", "Shoulders"] // Titles for the circle

            ZStack {
                // Draw radiating lines
                ForEach(0..<6) { index in
                    let angle = Angle.degrees(Double(index) / 6 * 360)
                    let endPoint = CGPoint(
                        x: center.x + CGFloat(cos(angle.radians)) * outerRadius,
                        y: center.y + CGFloat(sin(angle.radians)) * outerRadius
                    )

                    Path { path in
                        path.move(to: center)
                        path.addLine(to: endPoint)
                    }
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                }

                // Draw concentric circles
                ForEach(0..<4) { index in
                    let circleRadius = outerRadius - CGFloat(index) * spacing
                    Circle()
                        .stroke(
                            Color.gray.opacity(0.2),
                            lineWidth: 1
                        )
                        .frame(width: circleRadius * 2, height: circleRadius * 2)
                }

                // Draw labels and titles around the circle
                ForEach(0..<6) { index in
                    let angle = Angle.degrees(Double(index) / 6 * 360)
                    let labelPosition = CGPoint(
                        x: center.x + CGFloat(cos(angle.radians)) * (outerRadius + 30), // Offset beyond the radius
                        y: center.y + CGFloat(sin(angle.radians)) * (outerRadius + 30)
                    )

                    VStack(spacing: 0) {
                        Text(titles[index]) // Title for the section
                            .foregroundColor(.primary)
                            .fontWeight(.semibold)
                            .font(.callout)
                        Text(labels[index]) // Value for the section
                            .foregroundColor(.gold)
                            .font(.callout)
                            .bold()
                    }
                    .multilineTextAlignment(.center)
                    .position(labelPosition)
                }
            }
            .frame(width: geom.size.width, height: geom.size.height)
        }
    }
}

struct GlobalRankingsView: View {
    var body: some View {
        ZStack {
            RankingsBackground
            RankingsOverlay
        }
    }
    
    var RankingsBackground: some View {
        Image("stock-image")
            .resizable()
            .scaledToFill()
            .frame(height: 200)
            .clipped()
            .cornerRadius(20.0)
    }
    
    var RankingsOverlay: some View {
        RoundedRectangle(cornerRadius: 20.0)
            .frame(height: 200)
            .foregroundColor(Color.black.opacity(0.3))
            .overlay {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Global Rankings")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                        Spacer()
                        HStack(alignment: .top, spacing: 0) {
                            Text("23140")
                                .fontWeight(.semibold)
                                .font(.system(.largeTitle, design: .rounded))
                                .foregroundColor(.white)
                            Text("th")
                                .font(.footnote)
                                .foregroundColor(.white)
                            Spacer()
                            Button {
                                // Dummy button doesn't do anything.
                            } label: {
                                ZStack {
                                    // Make it the same size as rank on left.
                                    Text("23")
                                        .bold()
                                        .font(.largeTitle)
                                        .foregroundColor(.white)
                                        .hidden()
                                    Text("View All")
                                        .font(.footnote)
                                        .foregroundColor(.black)
                                        .fontWeight(.semibold)
                                }
                                .padding(.horizontal)
                                .background {
                                    RoundedRectangle(cornerRadius: 15.0)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                    .padding(20)
                    Spacer()
                }
        }
    }
}



