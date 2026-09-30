//
//  GameView.swift
//  HiLoFlip
//
//  Created by Isaac Luke on 9/7/26.
//

import SwiftUI

struct GameView: View {
    var game = HiLoFlipCardGame(playerNames: ["Player 1", "Player 2"])

    private let columns = [GridItem(.adaptive(minimum: 80))]

    var body: some View {
        ZStack {
            Color(red: 0, green: 119/255, blue: 0)
                .ignoresSafeArea()
            VStack {
                hand(for: 0)
                centerRow
                hand(for: 1)
            }
        }
    }

    private var centerRow: some View {
        HStack {
            TokenView(side: game.isTokenHi ? .hi : .lo)
            Button("Shuffle") {
                game.resetGame()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }

    private func hand(for index: Int) -> some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(game.hand(for: game.players[index]), id: \.value) { card in
                    CardView(card: card)
                }
            }
        }
    }
}

#Preview {
    GameView()
}
