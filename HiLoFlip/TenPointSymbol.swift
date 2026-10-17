//
//  TenPointSymbol.swift
//  HiLoFlip
//
//  Created by Isaac Luke on 10/17/26.
//

import SwiftUI

struct TenPointSymbol: Shape {
    private let pointCount = 5
    private let innerRatio: CGFloat = 0.4

    func path(in rect: CGRect) -> Path {
        let outer = min(rect.width, rect.height) / 2
        let center = CGPoint(x: rect.midX, y: rect.midY + outer * 0.1)
        var path = Path()
        for index in 0..<(pointCount * 2) {
            let radius = index.isMultiple(of: 2) ? outer : outer * innerRatio
            let corner = point(index: index, radius: radius, center: center)
            if index == 0 { path.move(to: corner) } else { path.addLine(to: corner) }
        }
        path.closeSubpath()
        return path
    }

    private func point(index: Int, radius: CGFloat, center: CGPoint) -> CGPoint {
        let angle = CGFloat.pi / 2 - CGFloat(index) * .pi / CGFloat(pointCount)
        return CGPoint(x: center.x + radius * cos(angle), y: center.y - radius * sin(angle))
    }
}

#Preview {
    TenPointSymbol()
        .fill(.black)
        .frame(width: 120, height: 120)
}
