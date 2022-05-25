//
//  Badge.swift
//  Landmarks
//
//  Created by 임성빈 on 2022/05/25.
//

import SwiftUI

struct Badge: View {
    var badgeSymbols: some View {
        ForEach(0 ..< 8) { index in
            RotatedBadgeSymbol(
                angle: Angle(degrees: Double(index) / Double(8)) * 360
            )
                .opacity(0.5)
        }
    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
            
            GeometryReader { geometer in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometer.size.width / 2.0, y: (3.0 / 4.0) * geometer.size.height)
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
