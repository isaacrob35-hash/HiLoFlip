//
//  Cardify.swift
//  HiLoFlip
//
//  Created by Isaac Luke on 10/17/26.
//

import SwiftUI

struct Cardify: ViewModifier, Animatable {
    private static let flipAngle = 180.0
    private var rotation: Double

    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }

    private var isFaceUp: Bool {
        rotation < Self.flipAngle / 2
    }

    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : Self.flipAngle
    }

    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                content
            } else {
                cardBack
                    .rotation3DEffect(.degrees(Self.flipAngle), axis: (x: 0, y: 1, z: 0))
            }
        }
        .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
    }

    private var cardBack: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(.black)
            backLabels
        }
    }

    private var backLabels: some View {
        VStack {
            topLabel
            Spacer()
            bottomLabel
        }
        .padding(8)
    }

    private var topLabel: some View {
        HStack {
            labelCircle(text: "HI")
            Spacer()
        }
    }

    private var bottomLabel: some View {
        HStack {
            Spacer()
            labelCircle(text: "LO")
        }
    }

    private func labelCircle(text: String) -> some View {
        ZStack {
            Circle()
                .strokeBorder(.white, lineWidth: 2)
            Text(text)
                .font(.title3)
                .bold()
                .foregroundStyle(.white)
        }
        .frame(width: 42, height: 42)
    }
}
