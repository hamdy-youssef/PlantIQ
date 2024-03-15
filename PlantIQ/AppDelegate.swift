//
//  AppDelegate.swift
//  PlantIQ
//
//  Created by Hamdy Youssef on 20/02/2024.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        if let isLoggedIn = UserDefaults.standard.object(forKey: "isLoggedIn") as? Bool {
            if isLoggedIn {
//                setHomeScreenTobeRoot()
            }else {
//                setLoginScreenTobeRoot ()
            }
        }
        return true
    }
    
    
    func setLoginScreenTobeRoot () {
        let sb = UIStoryboard (name: "Main", bundle: nil)
        let loginVC = sb.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.window?.rootViewController = loginVC
    }
    
    func setHomeScreenTobeRoot() {
        let sb = UIStoryboard (name: "Main", bundle: nil)
        let homeVC = sb.instantiateViewController (withIdentifier: "HomeTabBarVC") as! HomeTabBarVC
        self.window?.rootViewController = homeVC
    }
    
    
}

