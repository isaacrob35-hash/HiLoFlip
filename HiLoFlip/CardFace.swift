//
//  CardFace.swift
//  HiLoFlip
//
//  Created by Isaac Luke on 9/16/26.
//

import Foundation

enum CardFace {
    case faceUp, faceDown

    var flipped: CardFace {
        switch self {
            case .faceUp: return .faceDown
            case .faceDown: return .faceUp
        }
    }
}
