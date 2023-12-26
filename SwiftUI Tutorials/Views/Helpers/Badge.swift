//
//  Badge.swift
//  SwiftUI Tutorials
//
//  Created by Roman Shestopal on 11.08.2023.
//

import SwiftUI

struct Badge: View {
    private let numberSymbols = 7
    
    var badgeSymbols: some View {
        ForEach(0..<numberSymbols) { index in
            RotatedBadgeSymbol(angle: Angle(degrees: (Double(index) / Double(numberSymbols)) * 360))
                .opacity(0.5)
        }
    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.5 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2, y:  (2.5 / 4.0) * geometry.size.height)
            }
        }
        .scaledToFit()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
