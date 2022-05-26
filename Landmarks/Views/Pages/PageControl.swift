//
//  PageControl.swift
//  Landmarks
//
//  Created by 임성빈 on 2022/05/26.
//

import SwiftUI
import UIKit

// UIViewRepresentable 및 UIViewControllerRepresentable 유형은 기본 UIKit 유형에 해당하는 메서드와 함께 수명 주기가 동일합니다.
struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    // makeCoordinator() 메서드를 추가하여 새 코디네이터를 작성하고 반환합니다.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        // 코디네이터를 valueChanged 이벤트의 대상으로 추가하고 updateCurrentPage(sender:) 메서드를 수행할 작업으로 지정합니다.
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)
        
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    // UIPageControl과 같은 UIControl 하위 클래스는 위임 대신 대상 액션 패턴을 사용하기 때문에 이 코디네이터는 @objc 메서드를 구현하여 현재 페이지 바인딩을 업데이트합니다.
    class Coordinator: NSObject {
        var control: PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}
