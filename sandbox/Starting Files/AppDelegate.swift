//
//  AppDelegate.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-06-22.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import Analytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    //static var a11yIsOn = false

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let config = AnalyticsConfiguration(writeKey: "lY61ZdiZBqii3GxQKHVpA1juBFNl5M25")
        Analytics.setup(with: config)
        config.trackApplicationLifecycleEvents = true
        config.recordScreenViews = true
        
        // Override point for customization after application launch.
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
    
    var enableAllOrientation = false

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        if (enableAllOrientation == true){
            return UIInterfaceOrientationMask.allButUpsideDown
        }
        return UIInterfaceOrientationMask.portrait
    }


}

