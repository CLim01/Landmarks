//
//  Landmark.swift
//  Landmarks
//
//  Created by 임성빈 on 2022/05/24.
//

import Foundation
import SwiftUI
import CoreLocation

// landmarkData.json 데이터 파일에 있는 일부 키의 이름과 일치하는 몇 가지 속성을 가진 Landmark 구조를 정의합니다.
// Codable 준수를 추가하면 구조와 데이터 파일 간에 데이터를 더 쉽게 이동할 수 있습니다.
// 이 섹션의 뒷부분에 있는 Codable 프로토콜의 Decodable 구성 요소를 사용하여 파일에서 데이터를 읽습니다.
// 식별 가능한(Identifiable) 프로토콜 준수를 선언합니다.
// Landmark 데이터에 Identifiable 프로토콜에 필요한 id 속성이 이미 있습니다.
// 데이터를 읽을 때 속성을 추가하여 디코딩하기만 하면 됩니다.
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    
    // Landmarks 구조의 사용자는 이미지 자체에만 관심을 가지기 때문에 속성을 비공개로 설정합니다.
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    // JSON 데이터 구조의 저장소를 반영하는 중첩 좌표 유형을 사용하여 구조에 좌표 특성을 추가합니다.
    // 이 속성은 다음 단계에서 공용 계산 속성을 만드는 데만 사용되므로 개인 속성으로 표시합니다.
    private var coordinates: Coordinates
    
    // MapKit 프레임워크와 상호 작용하는 데 유용한 locationCoordinate 속성을 계산합니다.
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
