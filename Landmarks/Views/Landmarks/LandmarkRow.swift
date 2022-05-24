//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by 임성빈 on 2022/05/24.
//

import SwiftUI

struct LandmarkRow: View {
    // 초기화 중에 'Landmark Row' 유형이 'Landmark' 인스턴스를 필요로 하기 때문에 'Landmark' 속성을 추가하면 미리 보기가 작동을 중지합니다.
    // landmark를 Landmark Row의 저장 속성으로 추가합니다.
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        // 'LandmarkRow_Previews'의 미리보기 정적 속성에서 'LandmarkRow' 초기화자에 'Landmark' 매개 변수를 추가하여 'Landmark' 배열의 첫 번째 요소를 지정합니다.
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        // previewLayout(_:) 한정자를 사용하여 목록의 행에 근접한 크기 설정
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
