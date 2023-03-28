//
//  TabBarController.swift
//  StuffTabBar
//
//  Created by Teguh Wibowo Wijaya on 28/03/23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTabBar()
    }
    
    func setupTabBar() {
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .white.withAlphaComponent(1)
        tabBar.backgroundColor = Constant.mainPinkColor
        
        viewControllers = [
            createViewController(
                rootVC: ProductsViewController(),
                tabBarTitle: ProductsViewController.tabBarTitle,
                tabBarImage: ProductsViewController.tabBarImage
            ),
            createViewController(
                rootVC: ProfileViewController(),
                tabBarTitle: ProfileViewController.tabBarTitle,
                tabBarImage: ProfileViewController.tabBarImage
            ),
        ]
    }
    
    private func createViewController(
        rootVC: UIViewController,
        tabBarTitle: String,
        tabBarImage: UIImage?
    ) -> UIViewController {
        
        let vc = UINavigationController(rootViewController: rootVC)
        vc.tabBarItem.title = tabBarTitle
        vc.tabBarItem.image = tabBarImage
        
        return vc
    }

}
