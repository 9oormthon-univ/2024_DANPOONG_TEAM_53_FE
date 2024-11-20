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
        appearanceTabbar.backgroundColor = UIColor.white
        appearanceTabbar.shadowColor = UIColor.lightGray

        if #available(iOS 15.0, *) {
            self.tabBar.scrollEdgeAppearance = appearanceTabbar
        }
            
        self.tabBar.standardAppearance = appearanceTabbar
        self.tabBar.tintColor = UIColor(named: "color1")
        self.tabBar.backgroundColor = .white
    }
    
    private func configureTabbarAttribute() {
        let homeVC = self.createNavController(for: HomeVC(), title: "홈",
                                              image: UIImage(systemName: "house"),
                                              selectedImage: UIImage(systemName: "house.fill"))

        let recommendVC = self.createNavController(for: RecommendVC(),
                                              title: "추천",
                                              image: UIImage(systemName: "checkmark.circle"),
                                              selectedImage: UIImage(systemName: "checkmark.circle.fill"))
        
        let communityVC = self.createNavController(for: RecommendVC(),
                                              title: "게시판",
                                              image: UIImage(systemName: "list.dash"),
                                              selectedImage: UIImage(systemName: "list.dash"))
        
        let myPageVC = self.createNavController(for: MyPageVC(),
                                                title: "마이페이지",
                                                image: UIImage(systemName: "person"),
                                                selectedImage: UIImage(systemName: "person.fill"))
        
        self.viewControllers = [homeVC, recommendVC, communityVC, myPageVC]
    }
    
    private func createNavController(for rootViewController: UIViewController, title: String?, image: UIImage?, selectedImage: UIImage?) -> UIViewController {
        
        let navController = UINavigationController(rootViewController:  rootViewController)
        navController.navigationBar.isTranslucent = false
        navController.navigationBar.backgroundColor = .white
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.tabBarItem.selectedImage = selectedImage
        navController.interactivePopGestureRecognizer?.delegate = nil // 스와이프 제스처 enable true
        return navController
    }
}