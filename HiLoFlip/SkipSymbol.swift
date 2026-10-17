//
//  SkipSymbol.swift
//  HiLoFlip
//
//  Created by Isaac Luke on 10/17/26.
//

import SwiftUI

struct SkipSymbol: Shape {
    private let lineWidthRatio: CGFloat = 0.12

    func path(in rect: CGRect) -> Path {
        let side = min(rect.width, rect.height)
        let lineWidth = side * lineWidthRatio
        let radius = (side - lineWidth) / 2
        let center = CGPoint(x: rect.midX, y: rect.midY)
        var path = Path()
        path.addEllipse(in: CGRect(x: center.x - radius, y: center.y - radius,
                                   width: radius * 2, height: radius * 2))
        path.addPath(slash(center: center, radius: radius))
        return path.strokedPath(StrokeStyle(lineWidth: lineWidth, lineCap: .round))
    }

    private func slash(center: CGPoint, radius: CGFloat) -> Path {
        let offset = radius * cos(CGFloat.pi / 4)
        var line = Path()
        line.move(to: CGPoint(x: center.x - offset, y: center.y - offset))
        line.addLine(to: CGPoint(x: center.x + offset, y: center.y + offset))
        return line
    }
}

#Preview {
    SkipSymbol()
        .fill(.black)
        .frame(width: 120, height: 120)
}
