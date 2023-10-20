//
//  AppDelegate.swift
//  Dot_Order
//
//  Created by 김영현 on 2023/03/26.
//

import UIKit
import ApiAI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    public let baseUrl = "http://13.209.200.143:8080"
    public let userIdx = 1
    public let userGps = "(37.234234, 123.2342)"
    public let recommendUrl = "http://15.165.152.102:5000/search_menu?menu_name="
    public var orderIdx: Int = 39
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        var apiAI: ApiAI?
        apiAI = ApiAI.shared()
        
        // Define API.AI configuration here.
        let configuration = AIDefaultConfiguration()
        configuration.clientAccessToken = "3fae789965b16afa6a3749b4ed972ff11f7c27a6"

        apiAI?.configuration = configuration
        
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

