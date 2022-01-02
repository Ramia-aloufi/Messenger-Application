//
//  SceneDelegate.swift
//  Messenger Application
//
//  Created by R on 26/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else {
            return
        }

        ApplicationDelegate.shared.application(
            UIApplication.shared,
            open: url,
            sourceApplication: nil,
            annotation: [UIApplication.OpenURLOptionsKey.annotation]
        )
    }

        

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        FirebaseApp.configure()
                guard let ws = (scene as? UIWindowScene) else { return }
                window = UIWindow(windowScene: ws)
//        if let tabBarController = window?.rootViewController as? UITabBarController {
//            print("I passed here in willConnectTo")
//        guard let ws = (scene as? UIWindowScene) else { return }
//        window = UIWindow(windowScene: ws)
//        let vc = UINavigationController(rootViewController: ProfileViewController(nibName: "ProfileViewController", bundle: nil))
//        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
//            tabBarController.viewControllers?.append(vc)
//        }
                let ProfileVC = UINavigationController(rootViewController: ProfileViewController(nibName: "ProfileViewController", bundle: nil))
        let ChatVC = UINavigationController(rootViewController: ChatViewController(nibName: "ChatViewController", bundle: nil))
        let tabBar = UITabBarController()
        
        ProfileVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person.crop.rectangle", withConfiguration: UIImage.SymbolConfiguration(weight: .heavy)), tag: 0)
        ChatVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "bubble.right", withConfiguration: UIImage.SymbolConfiguration(weight: .heavy)), tag: 1)
        tabBar.setViewControllers([ProfileVC, ChatVC], animated: false)
        window?.rootViewController = tabBar





        
     //   window?.rootViewController = UITabBarItem(
        
            //UINavigationController(rootViewController: NewConversationViewController(nibName: "NewConversationViewController", bundle: nil))
            //LoginViewController(nibName: "LoginViewController", bundle: nil)

        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

