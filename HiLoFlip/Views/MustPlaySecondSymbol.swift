//
//  MustPlaySecondSymbol.swift
//  HiLoFlip
//
//  Created by Isaac Luke on 10/17/26.
//

import SwiftUI

struct MustPlaySecondSymbol: Shape {
    func path(in rect: CGRect) -> Path {
        let side = min(rect.width, rect.height)
        let origin = CGPoint(x: rect.midX - side / 2, y: rect.midY - side / 2)
        let back = card(at: CGPoint(x: origin.x + side * 0.1, y: origin.y + side * 0.05), side: side)
        let front = card(at: CGPoint(x: origin.x + side * 0.35, y: origin.y + side * 0.25), side: side)
        var path = back.strokedPath(StrokeStyle(lineWidth: side * 0.08))
        path.addPath(front)
        return path
    }

    private func card(at corner: CGPoint, side: CGFloat) -> Path {
        let size = CGSize(width: side * 0.55, height: side * 0.7)
        return Path(roundedRect: CGRect(origin: corner, size: size), cornerRadius: side * 0.1)
    }
}

#Preview {
    MustPlaySecondSymbol()
        .fill(.black)
        .frame(width: 120, height: 120)
}
