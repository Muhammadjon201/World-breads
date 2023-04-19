//
//  AppDelegate.swift
//  World breads
//
//  Created by ericzero on 11/29/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        setTabBar()
        setNavBar()
        let vc = WelcomeViewController()
        let nc = UINavigationController(rootViewController: vc)
        
        window?.rootViewController = nc
        window?.makeKeyAndVisible()
        return true
    }
    
    func setTabBar() {
            let selColor =  UIColor(red: 180/255, green: 13/255, blue: 34/255, alpha: 1)
            let normColor = UIColor(red: 79/255, green: 60/255, blue: 56/255, alpha: 1)
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            appearance.shadowImage = nil
            appearance.shadowColor = nil
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: selColor]
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: normColor]
            appearance.stackedLayoutAppearance.normal.iconColor = normColor
            appearance.stackedLayoutAppearance.selected.iconColor = selColor
            UITabBar.appearance().standardAppearance = appearance
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
        }

    func setNavBar() {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }

}




