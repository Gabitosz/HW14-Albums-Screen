//
//  TabBarController.swift
//  HW14
//
//  Created by Gabriel Zdravkovici on 30.10.2023.
//

import UIKit

final class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupTabBarController()
        setupTabBarViewControllers()
    }
    
    func setupTabBarController() {
        view.backgroundColor = .systemBackground
        tabBar.tintColor = .lightGray
        UITabBar.appearance().tintColor = UIColor.systemBlue
    }
    
    func setupTabBarViewControllers() {
        let firstViewController = AnotherViewController()
        let firstItemIcon = UITabBarItem(title: "Медиатека", image: UIImage(systemName: "photo.fill.on.rectangle.fill"), selectedImage: UIImage(systemName:"photo.fill.on.rectangle.fill"))
        firstViewController.tabBarItem = firstItemIcon
        let firstNavigationController = UINavigationController(rootViewController: firstViewController)
        
        let secondViewController = AnotherViewController()
        let secondItemIcon = UITabBarItem(title: "Для Вас", image: UIImage(systemName: "heart.text.square.fill"), selectedImage: UIImage(systemName:"heart.text.square.fill"))
        secondViewController.tabBarItem = secondItemIcon
        let secondNavigationController = UINavigationController(rootViewController: secondViewController)
        
        let thirdViewController = AlbumScreenViewController()
        let thirdItemIcon = UITabBarItem(title: "Альбомы", image: UIImage(systemName: "rectangle.stack.fill"), selectedImage: UIImage(systemName:"rectangle.stack.fill"))
        thirdViewController.tabBarItem = thirdItemIcon
        
        let fourthViewController = AnotherViewController()
        let fourthItemIcon = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName:"magnifyingglass"))
        fourthViewController.tabBarItem = fourthItemIcon
        let fourthNavigationController = UINavigationController(rootViewController: fourthViewController)
        
        let controllers = [firstNavigationController, secondNavigationController, thirdViewController, fourthNavigationController]
        viewControllers = controllers
    }
    
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        true
    }
    
}
