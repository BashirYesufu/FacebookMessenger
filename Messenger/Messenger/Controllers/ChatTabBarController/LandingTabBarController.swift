//
//  LandingTabBarController.swift
//  Messenger
//
//  Created by Decagon Macbook Pro on 15/10/2021.
//

import UIKit

class LandingTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        insertViewContollers()
        tabBar.isHidden = false
    }

    private func insertViewContollers() {
        let chats = UINavigationController(rootViewController: ConversationsViewController())
        let profile = UINavigationController(rootViewController: ProfileViewController())
        let viewControllers: [UIViewController] = [chats, profile]
        
        self.setViewControllers(viewControllers, animated: false)
        self.tabBar.layer.cornerRadius = 15
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .blue
    }
}
