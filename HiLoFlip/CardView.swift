//
//  CardView.swift
//  HiLoFlip
//
//  Created by Isaac Luke on 9/6/26.
//

import SwiftUI

struct CardView: View {
    let number: Int
    @State private var face = CardFace.faceUp

    var body: some View {
        ZStack {
            switch face {
                case .faceUp: cardFront
                case .faceDown: cardBack
            }
        }
        .frame(width: 100, height: 155)
        .onTapGesture {
            face = face.flipped
        }
    }

    private var cardFront: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(colorForIndex(number))
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
            Text("\(number)")
                .font(.title)
                .bold()
                .underline(number % 10 == 6 || number % 10 == 9)
                .foregroundStyle(.white)
        }
        .frame(width: 62, height: 62)
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
                .strokeBorder(.white, lineWidth: 3)
            Text(text)
                .font(.title2)
                .bold()
                .foregroundStyle(.white)
        }
        .frame(width: 55, height: 55)
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
        }
    }

    private var cornerIcon: some View {
        Group {
            if let special = symbol(for: number) {
                iconCircle(for: special)
            }
        }
    }

    private func iconCircle(for special: SpecialSymbol) -> some View {
        ZStack {
            Circle()
                .fill(.white)
            Image(systemName: special.sfSymbolName)
                .font(.caption)
                .foregroundStyle(.black)
        }
        .frame(width: 24, height: 24)
    }
}

func colorForIndex(_ index: Int) -> Color {
    let hue = Double(index) / 100.0
    return Color(hue: hue, saturation: 0.8, brightness: 1)
}

#Preview {
    CardView(number: 10)
}
