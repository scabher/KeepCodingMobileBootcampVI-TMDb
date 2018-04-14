//
//  AppAssembly.swift
//  TMDb
//
//  Created by Sergio Cabrera Hernández on 14/4/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import UIKit
import TMDbCore

final class AppAssembly {
    
    private(set) lazy var window = UIWindow(frame: UIScreen.main.bounds)
    private lazy var rootViewController = UINavigationController()
    private lazy var coreAssembly = CoreAssembly(navigationController: rootViewController)
    
    func setupRootViewController() {
        // Aquí es cuando se puede configurar dependiendo del dispositivo, ...
        //if UIUserInterfaceIdiom == .ipad {}

        let featuredViewController = coreAssembly.featuredAssembly.viewController()
        rootViewController.pushViewController(featuredViewController, animated: false)
        window.rootViewController = rootViewController
    }
    
}
