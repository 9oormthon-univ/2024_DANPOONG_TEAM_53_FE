//
//  MainTabbar.swift
//  Irumso
//
//  Created by 김은상 on 11/20/24.
//

import UIKit

final class MainTabbar: UITabBarController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTabbar()
        self.configureTabbarAttribute()
        
    }
    
    
    
}


extension MainTabbar {
    
    private func configureTabbar() {
        let appearanceTabbar = UITabBarAppearance()
        appearanceTabbar.configureWithOpaqueBackground()
        appearanceTabbar.backgroundColor = UIColor(hexCode: "63B85F")
        appearanceTabbar.shadowColor = UIColor.lightGray
        
        if #available(iOS 15.0, *) {
            self.tabBar.scrollEdgeAppearance = appearanceTabbar
        }
        
        self.tabBar.standardAppearance = appearanceTabbar
        self.tabBar.tintColor = .white
        self.tabBar.unselectedItemTintColor = UIColor(hexCode: "C6F4C3") // 예: 연한 회색
        
    }
    
    private func configureTabbarAttribute() {
        let homeVC = self.createNavController(for: HomeVC(), title: "홈",
                                              image: UIImage(systemName: "house"),
                                              selectedImage: UIImage(systemName: "house.fill"))
        
        let recommendVC = self.createNavController(for: RecommendVC(),
                                                   title: "추천",
                                                   image: UIImage(systemName: "checkmark.circle"),
                                                   selectedImage: UIImage(systemName: "checkmark.circle.fill"))
        
        let communityVC = self.createNavController(for: CommunityVC(),
                                                   title: "소근소근",
                                                   image: UIImage(systemName: "list.dash"),
                                                   selectedImage: UIImage(systemName: "list.dash"))
        
        communityVC.navigationItem.largeTitleDisplayMode = .always
        
        
        let myPageVC = self.createNavController(for: MyPageVC(),
                                                title: "마이페이지",
                                                image: UIImage(systemName: "person"),
                                                selectedImage: UIImage(systemName: "person.fill"))
        
        self.viewControllers = [homeVC, recommendVC, communityVC, myPageVC]
    }
    
    private func createNavController(for rootViewController: UIViewController, title: String?, image: UIImage?, selectedImage: UIImage?) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: rootViewController)
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        navController.navigationBar.standardAppearance = appearance
        navController.navigationBar.scrollEdgeAppearance = appearance
        navController.navigationBar.prefersLargeTitles = true
       
        rootViewController.navigationItem.title = "이룸소"
        rootViewController.navigationItem.largeTitleDisplayMode = .always 
        
        // Tab bar 설정
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.tabBarItem.selectedImage = selectedImage
        
        // 스와이프 제스처 활성화
        navController.interactivePopGestureRecognizer?.delegate = nil
        return navController
    }
}
//import SwiftUI
//
//extension UIViewController {
//    private struct Preview: UIViewControllerRepresentable {
//        let viewController: UIViewController
//
//        func makeUIViewController(context: Context) -> UIViewController {
//            return viewController
//        }
//
//        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//        }
//    }
//
//    func toPreview() -> some View {
//        Preview(viewController: self)
//    }
//}
//
//
//import SwiftUI
//
//struct VCPreView: PreviewProvider {
//    static var previews: some View {
//        MainTabbar().toPreview()
//    }
//}
