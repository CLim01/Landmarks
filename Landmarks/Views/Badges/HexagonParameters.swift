//
//  HexagonParameters.swift
//  Landmarks
//
//  Created by 임성빈 on 2022/05/25.
//

// CoreGraphics를 가져와 CGPoint를 사용할 수 있습니다.
import CoreGraphics

// 육각형의 한 변을 나타내는 세 점을 고정하는 세그먼트 구조를 정의합니다.
struct HexagonParameters {
    struct Segment {
        // 각 변은 이전 변이 끝나는 곳에서 시작하여 첫 번째 Point로 직선으로 이동한 다음 모서리의 베지어 곡선을 넘어 두 번째 Point로 이동합니다.
        // 세 번째 Point는 곡선의 모양을 제어합니다.
        let line: CGPoint
        let curve: CGPoint
        let control: CGPoint        
    }
    
    static let adjustment: CGFloat = 0.085
    
    static let segments = [
        Segment(
            line:    CGPoint(x: 0.60, y: 0.05),
            curve:   CGPoint(x: 0.40, y: 0.05),
            control: CGPoint(x: 0.50, y: 0.00)
        ),
        Segment(
            line:    CGPoint(x: 0.05, y: 0.20 + adjustment),
            curve:   CGPoint(x: 0.00, y: 0.30 + adjustment),
            control: CGPoint(x: 0.00, y: 0.25 + adjustment)
        ),
        Segment(
            line:    CGPoint(x: 0.00, y: 0.70 - adjustment),
            curve:   CGPoint(x: 0.05, y: 0.80 - adjustment),
            control: CGPoint(x: 0.00, y: 0.75 - adjustment)
        ),
        Segment(
            line:    CGPoint(x: 0.40, y: 0.95),
            curve:   CGPoint(x: 0.60, y: 0.95),
            control: CGPoint(x: 0.50, y: 1.00)
        ),
        Segment(
            line:    CGPoint(x: 0.95, y: 0.80 - adjustment),
            curve:   CGPoint(x: 1.00, y: 0.70 - adjustment),
            control: CGPoint(x: 1.00, y: 0.75 - adjustment)
        ),
        Segment(
            line:    CGPoint(x: 1.00, y: 0.30 + adjustment),
            curve:   CGPoint(x: 0.95, y: 0.20 + adjustment),
            control: CGPoint(x: 1.00, y: 0.25 + adjustment)
        )
    ]
}
