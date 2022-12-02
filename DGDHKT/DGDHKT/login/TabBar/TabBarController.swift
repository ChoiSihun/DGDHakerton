//
//  TabBarController.swift
//  DGDHKT
//
//  Created by 최시훈 on 2022/12/02.
//

import UIKit

class TabBarcontroller: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        self.tabBar.backgroundColor = UIColor(red: 96.0 / 255, green: 136.0 / 255, blue: 198.0 / 255, alpha: 1)
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = .lightGray


        let sarchTabBar = UIViewController()
        sarchTabBar.tabBarItem.title = ""
        sarchTabBar.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        let homeTabBar = UINavigationController(rootViewController: HomeVC())
        homeTabBar.tabBarItem.title = ""
        homeTabBar.tabBarItem.image = UIImage(systemName: "house")
        
        viewControllers = [homeTabBar, sarchTabBar]
    }
    
}
