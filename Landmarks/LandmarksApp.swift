//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 임성빈 on 2022/05/24.
//

import SwiftUI

@main
struct LandmarksApp: App {
    // LandmarksApp을 업데이트하여 모델 인스턴스를 만든 다음 EnvironmentObject(_:) 한정자를 사용하여 ContentView에 제공합니다.
    // @StateObject 특성을 사용하여 앱 수명 동안 지정된 속성에 대한 모델 개체를 한 번만 초기화합니다.
    // 이것은 앱 인스턴스에서 속성을 사용하는 경우뿐만 아니라 보기에서 속성을 사용하는 경우에도 마찬가지입니다.
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        
        // 이 Scene은 watchOS에만 해당되므로 조건부 컴파일을 추가합니다.
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
    }
}
