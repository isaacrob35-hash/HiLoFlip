//
//  SpecialSymbol.swift
//  HiLoFlip
//
//  Created by Isaac Luke on 9/16/26.
//

import Foundation

enum SpecialSymbol {
    case tenPoint, skip, mustPlaySecond

    var sfSymbolName: String {
        switch self {
            case .tenPoint: return "star.fill"
            case .skip: return "circle.slash"
            case .mustPlaySecond: return "doc.on.doc.fill"
        }
    }
}

func symbol(for number: Int) -> SpecialSymbol? {
    switch number % 10 {
        case 0: return .tenPoint
        case 1: return .skip
        case 2: return .mustPlaySecond
        default: return nil
    }
}
