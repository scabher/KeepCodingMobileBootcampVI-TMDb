//
//  AppDelegate.swift
//  TMDb
//
//  Created by Guille Gonzalez on 13/04/2018.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    let appAssembly = AppAssembly()

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        appAssembly.setupRootViewController()
        appAssembly.window.makeKeyAndVisible()
        
		return true
	}
}

