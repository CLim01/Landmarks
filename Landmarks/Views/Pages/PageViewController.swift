//
//  PageViewController.swift
//  Landmarks
//
//  Created by 임성빈 on 2022/05/26.
//

import SwiftUI
import UIKit

// PageViewController 유형을 UIViewControllerRepresentable에 적합한 것으로 선언합니다.
struct PageViewController<Page: View>: UIViewControllerRepresentable {
    // page view controller는 Page 인스턴스 배열을 저장하며, 이 배열은 View 유형이어야 합니다.
    // 랜드마크 사이를 스크롤하는 데 사용하는 페이지입니다.
    var pages: [Page]
    // 먼저 현재 페이지 바인딩을 PageViewController의 속성으로 추가합니다.
    @Binding var currentPage: Int
    
    // makeCoordinator() 메서드를 makeUIViewController(context:)보다 먼저 호출하므로 뷰 컨트롤러를 구성할 때 코디네이터 개체에 액세스할 수 있습니다.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // 원하는 구성으로 UIPageViewController를 만드는 makeUIViewController(context:) 메서드를 추가합니다.
    // SwiftUI는 view를 표시할 준비가 되면 이 메서드를 한 번 호출한 다음 보기 컨트롤러의 수명 주기를 관리합니다.
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )
        
        // 코디네이터를 UIPageViewController의 데이터 원본으로 추가합니다.
        pageViewController.dataSource = context.coordinator
        // 코디네이터를 데이터 원본과 함께 UIPageViewController의 대리자로 할당합니다.
        // 바인딩이 양방향으로 연결되면 텍스트 보기가 업데이트되어 각 스와이프 후 올바른 페이지 번호가 표시됩니다.
        pageViewController.delegate = context.coordinator
        
        return pageViewController
    }
    
    // 표시할 뷰 컨트롤러를 제공하기 위해 setViewController(_:direction:animated:)를 호출하는 udateUIViewController(_:context:) 메서드입니다.
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            // @Binding 속성을 선언하는 것 외에도 setViewControllers(_:direction:animated:)에 대한 호출을 업데이트하여 현재 페이지 바인딩의 값을 전달합니다.
            [context.coordinator.controllers[currentPage]], direction: .forward, animated: true
        )
    }
    
    // PageViewController 내에 중첩된 Coordinator 클래스를 선언합니다.
    // SwiftUI는 UIViewControllerRepresentable 유형의 코디네이터를 관리하고 위에서 만든 메서드를 호출할 때 컨텍스트의 일부로 제공합니다.
    // 코디네이터를 UIPageViewControllerDelegate로 구성합니다.
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        // 뷰의 페이지 배열을 사용하여 코디네이터에서 컨트롤러 배열을 초기화합니다.
        // 코디네이터는 이러한 컨트롤러를 한 번만 초기화하기 때문에 보기 컨트롤러를 업데이트하기 전에 해당 컨트롤러를 저장하기에 좋은 장소입니다.
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0)}
        }
        
        // 코디네이터 유형에 UIPageViewControllerDataSource 준수를 추가하고 필요한 두 가지 방법을 구현합니다.
        // 이러한 두 가지 방법은 보기 컨트롤러 간에 앞뒤로 스와이프할 수 있도록 보기 컨트롤러 간의 관계를 설정합니다.
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else { return nil }
            
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else { return nil }
            
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        
        // pageViewController(_:didFinishAnimating:previousViewController:transitionCompleted): Bool) 메서드를 추가합니다.
        // 왜냐하면 SwiftUI는 페이지 전환 애니메이션이 완료될 때마다 이 메서드를 호출하여 현재 뷰 컨트롤러의 인덱스를 찾고 바인딩을 업데이트할 수 있습니다.
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
        
    }
}
