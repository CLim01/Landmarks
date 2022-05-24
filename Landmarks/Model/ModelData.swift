//
//  ModelData.swift
//  Landmarks
//
//  Created by 임성빈 on 2022/05/24.
//

import Foundation

// landmarkData.json에서 초기화하는 landmarks 배열을 만듭니다.
var landmarks: [Landmark] = load("landmarkData.json")

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
