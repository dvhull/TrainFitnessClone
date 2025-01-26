//
//  SharedComponents.swift
//  TrainFitnessDemo
//
//  Created by David Hull on 2025-01-25.
//

import Foundation
import SwiftUI

// TODO: Seperate these into different files IE. Buttons etc...
struct CustomSelectableButton: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(title)
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundColor(isSelected ? .white : .black)
                Spacer()
            }
            .padding(.vertical, 8)
            .background {
                RoundedRectangle(cornerRadius: 8.0)
                    .foregroundColor(isSelected ? .black : Color.secondaryButton)
            }
        }
    }
}

// DropDown Button. 
struct DummyDropdownButton: View {
    var title: String

    var body: some View {
        Button {
            // No functionality, dummy button
        } label: {
            HStack(spacing: 0) {
                Text("\(title)  ")
                    .font(.footnote)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                Image(systemName: "chevron.down")
                    .fontWeight(.semibold)
                    .imageScale(.small)
                    .foregroundColor(.black)
                    .font(.footnote)
            }
            .padding(8)
            .background {
                RoundedRectangle(cornerRadius: 10.0)
                    .foregroundColor(Color.primaryButton)
            }
        }
    }
}

// Title text with custom font weight represented as a decimal value IE. 0.6.
struct TextWithWeight: UIViewRepresentable {
    let text: String
    let weight: CGFloat

    typealias UIViewType = UITextView

    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.text = text
        view.font = UIFont.systemFont(
            ofSize: UIFont.preferredFont(forTextStyle: .title3).pointSize,
            weight: UIFont.Weight(rawValue: weight) // Convert CGFloat to UIFont.Weight
        )
        view.isScrollEnabled = false
        view.isEditable = false
        view.isSelectable = false
        view.backgroundColor = .clear
        return view
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        uiView.font = UIFont.systemFont(
            ofSize: UIFont.preferredFont(forTextStyle: .title3).pointSize,
            weight: UIFont.Weight(rawValue: weight)
        )
    }

    @MainActor func sizeThatFits(_ proposal: ProposedViewSize, uiView: UITextView, context: Context) -> CGSize? {
        return uiView.sizeThatFits(proposal.replacingUnspecifiedDimensions())
    }
}

struct HeaderView: View {
    var title: String
    
    var body: some View {
        HStack(alignment: .center) {
            TextWithWeight(text: title, weight: 0.4)
                .foregroundColor(.red)
            Spacer()
            DummyDropdownButton(title: "Last 7 Days")
        }
        .padding(.bottom, 10)
    }
}
