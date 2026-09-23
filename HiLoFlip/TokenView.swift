//
//  TokenView.swift
//  HiLoFlip
//
//  Created by Isaac Luke on 9/6/26.
//

import SwiftUI

struct TokenView: View {
    let side: TokenSide

    var body: some View {
        ZStack {
            Circle()
                .fill(.black)
            Circle()
                .inset(by: 10)
                .strokeBorder(.white, lineWidth: 2)
            label
        }
        .frame(width: 150, height: 150)
    }

    private var label: some View {
        Text(side.label)
            .font(.largeTitle)
            .bold()
            .foregroundStyle(.white)
    }
}

#Preview {
    TokenView(side: .hi)
}
