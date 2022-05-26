//
//  PageView.swift
//  Landmarks
//
//  Created by 임성빈 on 2022/05/26.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    // @State 변수를 선언하고 하위 PageView 컨트롤러를 만들 때 속성에 바인딩을 전달합니다.
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            // $ 구문을 사용하여 state로 저장된 값에 대한 바인딩을 생성해야 합니다.
            PageViewController(pages: pages, currentPage: $currentPage)

            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding()
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
