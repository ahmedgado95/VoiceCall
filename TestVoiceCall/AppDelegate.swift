//
//  AppDelegate.swift
//  TestVoiceCall
//
//  Created by ahmed gado on 9/20/20.
//  Copyright © 2020 ahmed gado. All rights reserved.
//

import UIKit
import JitsiMeet

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        guard let launchOptions = launchOptions else { return false }
        return JitsiMeet.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    // MARK: - Linking delegate methods

    func application(_ application: UIApplication,
                     continue userActivity: NSUserActivity,
                     restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        return JitsiMeet.sharedInstance().application(application, continue: userActivity, restorationHandler: restorationHandler)
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return JitsiMeet.sharedInstance().application(app, open: url, options: options)
    }
}
