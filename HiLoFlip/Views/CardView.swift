//
//  CardView.swift
//  HiLoFlip
//
//  Created by Isaac Luke on 9/6/26.
//

import SwiftUI

struct CardView: View {
    var card: HiLoGame.Card

    var body: some View {
        ZStack {
            if card.isFaceUp {
                cardFront
            } else {
                cardBack
            }
        }
        .frame(width: 80, height: 124)
    }

    private var cardFront: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(colorForIndex(card.value))
            corners
            numberCircle
        }
    }

    private var cardBack: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(.black)
            backLabels
        }
    }

    private var numberCircle: some View {
        ZStack {
            Circle()
                .fill(.black)
            Text("\(card.value)")
                .font(.title2)
                .bold()
                .underline(card.value % 10 == 6 || card.value % 10 == 9)
                .foregroundStyle(.white)
        }
        .frame(width: 50, height: 50)
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

    private var corners: some View {
        VStack {
            topCorner
            Spacer()
            bottomCorner
        }
        .padding(6)
    }

    private var topCorner: some View {
        HStack {
            cornerIcon
            Spacer()
        }
    }

    private var bottomCorner: some View {
        HStack {
            Spacer()
            cornerIcon
                .rotationEffect(.degrees(180))
        }
    }

    private var cornerIcon: some View {
        Group {
            if card.isSpecialCard {
                ZStack {
                    Circle()
                        .fill(.white)
                    symbolShape
                        .padding(5)
                }
                .frame(width: 24, height: 24)
            }
        }
    }

    @ViewBuilder
    private var symbolShape: some View {
        if card.isTenPointCard {
            TenPointSymbol().fill(.black)
        } else if card.isSkipCard {
            SkipSymbol().fill(.black)
        } else if card.isMustPlaySecondCard {
            MustPlaySecondSymbol().fill(.black)
        }
    }

    private func colorForIndex(_ index: Int) -> Color {
        let hue = Double(index) / 100.0
        return Color(hue: hue, saturation: 0.8, brightness: 1)
    }
}

#Preview {
    HStack {
        CardView(card: HiLoGame.Card(value: 10))
        CardView(card: HiLoGame.Card(value: 41))
        CardView(card: HiLoGame.Card(value: 52))
        CardView(card: HiLoGame.Card(value: 23))
    }
}
