//
//  GameView.swift
//  HiLoFlip
//
//  Created by Isaac Luke on 9/7/26.
//

import SwiftUI

struct GameView: View {
    @State private var cards = [Int]()
    @State private var isHi = true

    private let columns = [GridItem(.adaptive(minimum: 100))]

    var body: some View {
        ZStack {
            Color(red: 0, green: 119/255, blue: 0)
                .ignoresSafeArea()
            VStack {
                topRow
                cardGrid
            }
        }
        .onAppear {
            deal()
        }
    }

    private var topRow: some View {
        HStack {
            TokenView(isHi: isHi)
            Button("Shuffle") {
                deal()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }

    private var cardGrid: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(cards, id: \.self) { number in
                    CardView(number: number)
                }
            }
        }
    }

    private func deal() {
        isHi = Bool.random()
        let deck = Array(1...100).shuffled()
        cards = Array(deck.prefix(7))
    }
}

#Preview {
    GameView()
}
