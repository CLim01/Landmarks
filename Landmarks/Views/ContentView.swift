//
//  ContentView.swift
//  Landmarks
//
//  Created by 임성빈 on 2022/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var  selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            // ContentView_Previews를 업데이트하여 모델 개체를 환경에 추가합니다.
            // 이렇게 하면 모든 하위 뷰에서 개체를 사용할 수 있습니다.
            .environmentObject(ModelData())
    }
}
