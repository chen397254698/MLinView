//
//  AppDelegate.swift
//  MLinViewSample
//
//  Created by chen on 2020/6/16.
//  Copyright © 2020 chen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: MLinVerticalViewController())
        window?.makeKeyAndVisible()
        return true
    }

}

    