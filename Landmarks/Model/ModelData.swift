//
//  ModelData.swift
//  Landmarks
//
//  Created by 임성빈 on 2022/05/24.
//

import Foundation
// Combine 프레임워크에서 Observable Object 프로토콜을 준수하는 새 모델 유형을 선언합니다.
import Combine

// SwiftUI는 관찰 가능한 개체(ObservableObject)에 가입하고 데이터가 변경될 때 새로 고침이 필요한 보기를 업데이트합니다.
final class ModelData: ObservableObject {
    // landmarkData.json에서 초기화하는 landmarks 배열을 만듭니다.
    // ObservableObject는 subscribers가 변경 내용을 선택할 수 있도록 데이터에 대한 변경 내용을 게시해야 합니다.
    @Published var landmarks: [Landmark] = load("landmarkData.json")
}

// 앱의 기본 번들에서 지정된 이름의 JSON 데이터를 가져오는 load(_:) 메서드를 만듭니다.
// 로드 방법은 반환 형식이 코드화 프로토콜의 한 구성 요소인 디코딩 프로토콜에 대한 적합성에 의존한다.
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
