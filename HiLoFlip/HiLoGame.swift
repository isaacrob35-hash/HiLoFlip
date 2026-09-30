//
//  HiLoGame.swift
//  HiLoFlip
//
//  Created by Isaac Luke on 9/25/26.
//

import Foundation

struct HiLoGame {
    static let handSize = 7

    private(set) var deck: [Card] = []
    private(set) var players: [Player] = []
    private(set) var isTokenHi = true

    init(playerNames: [String]) {
        isTokenHi = Bool.random()
        for value in 1...100 {
            deck.append(Card(value: value))
        }
        for name in playerNames {
            players.append(Player(name: name))
        }
        dealCards()
    }

    private mutating func dealCards() {
        deck.shuffle()
        for index in players.indices {
            for _ in 1...Self.handSize {
                if let card = deck.popLast() {
                    players[index].hand.append(card)
                }
            }
        }
    }

    mutating func resetGame() {
        isTokenHi = Bool.random()
        deck = []
        for value in 1...100 {
            deck.append(Card(value: value))
        }
        for index in players.indices {
            players[index].hand = []
        }
        dealCards()
    }

    struct Card {
        let value: Int
        fileprivate(set) var isFaceUp = true

        var isSpecialCard: Bool {
            isTenPointCard || isSkipCard || isMustPlaySecondCard
        }

        var isTenPointCard: Bool { value % 10 == 0 }
        var isSkipCard: Bool { value % 10 == 1 }
        var isMustPlaySecondCard: Bool { value % 10 == 2 }

        init(value: Int) {
            self.value = value
        }
    }

    struct Player {
        private(set) var name: String
        fileprivate(set) var hand: [Card] = []
        private(set) var score = 0

        init(name: String) {
            self.name = name
        }
    }
}
