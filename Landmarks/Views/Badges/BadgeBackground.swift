//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by 임성빈 on 2022/05/25.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                // 지오메트리의 두 치수 중 가장 작은 치수를 사용하면 배지의 포함 뷰가 정사각형이 아닐 때 배지의 가로 세로 비율이 유지됩니다.
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                
                // move(to:) 방법은 마치 가상의 펜이나 연필이 그리기 시작하기를 기다리는 것처럼 도형의 경계 내에서 그리기 커서를 이동합니다.
                path.move(
                    to: CGPoint(
                        x: width * 0.95 + xOffset,
                        y: height * (0.20 + HexagonParameters.adjustment)
                        )
                )
                
                HexagonParameters.segments.forEach { segment in
                    // addLine(to:) 메서드는 단일 점을 취하여 그립니다.
                    // 라인을 추가하기 위한 연속 addLine(to:) 메서드는 이전 지점에서 선을 시작하여 새 지점으로 계속됩니다.
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )
                    
                    // addQuadCurve(to:control:) 방법을 사용하여 배지의 모서리에 대한 Bézier 곡선을 그립니다.
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y
                        ),
                        control: CGPoint(
                            x: width * segment.control.x + xOffset,
                            y: height * segment.control.y
                        )
                    )
                }
            }
            .fill(.linearGradient(
                Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
        }
        // 그라데이션 채우기에 가로 세로 비율(_:contentMode:) 수정자를 적용합니다.
        // 배지는 가로 세로 비율을 1:1로 유지하여 상위 뷰가 정사각형이 아니더라도 뷰의 중심 위치를 유지합니다.
        .aspectRatio(1, contentMode: .fit)
    }
    
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    
    static let gradientEnd = Color(red: 239.0 / 255, green: 170.0 / 255, blue: 120.0 / 255)
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
