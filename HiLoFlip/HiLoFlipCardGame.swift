//
//  HiLoFlipCardGame.swift
//  HiLoFlip
//
//  Created by Isaac Luke on 9/25/26.
//

import SwiftUI

@Observable
class HiLoFlipCardGame {
    private var model: HiLoGame

    init(playerNames: [String]) {
        model = HiLoGame(playerNames: playerNames)
    }

    var players: [HiLoGame.Player] {
        model.players
    }

    var isTokenHi: Bool {
        model.isTokenHi
    }

    func hand(for player: HiLoGame.Player) -> [HiLoGame.Card] {
        player.hand
    }

    func resetGame() {
        model.resetGame()
    }
}
