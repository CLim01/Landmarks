//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by 임성빈 on 2022/05/25.
//

import SwiftUI

struct FavoriteButton: View {
    // 바인딩을 사용하기 때문에 이 보기 내에서 변경한 내용이 데이터 원본으로 다시 전파됩니다.
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
            .previewLayout(.sizeThatFits)
    }
}
