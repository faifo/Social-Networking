//
//  SceneDelegate.swift
//  Quickscop
//
//  Created by Solo on 16/10/2021.
//

import UIKit
import ESTabBarController_swift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let signInVc = StoryboardBuilder.shared.signIn()
        let nav = UINavigationController(rootViewController: signInVc)
        window.rootViewController = nav
        self.window = window
        window.makeKeyAndVisible()
    }
    
    
    private func mainScreen() -> ESTabBarController {
        let tabBarController = ESTabBarController()
        let v1 = BaseVC()
        let v2 = BaseVC()
        let v3 = BaseVC()
        let v4 = BaseVC()
        let v5 = BaseVC()
        
        v1.tabBarItem = ESTabBarItem.init(title: "home".l10n(), image: UIImage(named: "tabbar_home"), selectedImage: UIImage(named: "tabbar_home"))
        v2.tabBarItem = ESTabBarItem.init(title: "competion", image: UIImage(named: "tabbar_trophy"), selectedImage: UIImage(named: "tabbar_trophy"))
        v3.tabBarItem = ESTabBarItem.init(title: "categories", image: UIImage(named: "tabbar_categories"), selectedImage: UIImage(named: "tabbar_categories"))
        v4.tabBarItem = ESTabBarItem.init(title: "notifications", image: UIImage(named: "tabbar_notifications"), selectedImage: UIImage(named: "tabbar_notifications"))
        v5.tabBarItem = ESTabBarItem.init(title: "profile", image: UIImage(named: "tabbar_profile"), selectedImage: UIImage(named: "tabbar_profile"))

        tabBarController.viewControllers = [UINavigationController(rootViewController: v1),
                                            UINavigationController(rootViewController: v2),
                                            UINavigationController(rootViewController: v3),
                                            UINavigationController(rootViewController: v4),
                                            UINavigationController(rootViewController: v5)]
        return tabBarController
    }
    
    

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
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

