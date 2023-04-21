//
//  AppDelegate.swift
//  Dot_Order
//
//  Created by 김영현 on 2023/03/26.
//

import UIKit
import Kommunicate

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Kommunicate.setup(applicationId: "2a2673270b8dda73160da2ece9c5926ee")
        
        let kmUser = KMUser()
        kmUser.userId = "PVngfHPK2X9o9Xepm9eB1PYlgZgeO9Bu"
        kmUser.displayName = "Happy Eel"
        
        // Use this same API for login
        Kommunicate.registerUser(kmUser, completion: {
            response, error in
            guard error == nil else {return}
            print("login success") // Now, you can launch the chat screen
        })
        
        return true
        
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

