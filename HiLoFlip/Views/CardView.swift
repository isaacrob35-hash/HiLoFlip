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
        cardFront
            .modifier(Cardify(isFaceUp: card.isFaceUp))
            .frame(width: 80, height: 124)
            .shadow(color: .black.opacity(0.3), radius: 3, x: 1, y: 3)
    }

    private var cardFront: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(colorForIndex(card.value))
            corners
            numberBadge(size: 46, fontSize: 24)
        }
    }

    private func numberBadge(size: CGFloat, fontSize: CGFloat) -> some View {
        ZStack {
            Circle()
                .fill(.black)
            Text("\(card.value)")
                .font(.system(size: fontSize, weight: .black, design: .rounded))
                .underline(card.value % 10 == 6 || card.value % 10 == 9)
                .foregroundStyle(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.6)
                .padding(size * 0.12)
        }
        .frame(width: size, height: size)
    }

    private var corners: some View {
        VStack {
            HStack {
                topCorner
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                bottomCorner
            }
        }
        .padding(4)
    }

    private var topCorner: some View {
        VStack(spacing: 2) {
            numberBadge(size: 20, fontSize: 10)
            cornerIcon
        }
    }

    private var bottomCorner: some View {
        VStack(spacing: 2) {
            cornerIcon
            numberBadge(size: 20, fontSize: 10)
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
                        .padding(3)
                }
                .frame(width: 15, height: 15)
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
        CardView(card: HiLoGame.Card(value: 51))
        CardView(card: HiLoGame.Card(value: 42))
        CardView(card: HiLoGame.Card(value: 100))
    }
}
