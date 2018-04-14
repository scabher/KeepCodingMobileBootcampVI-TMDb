//
//  PushDetailNavigator.swift
//  TMDbCore
//
//  Created by Sergio Cabrera Hernández on 14/4/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import UIKit

final class PushDetailNavigator {
    private let navigationController: UINavigationController
    private unowned let detailViewControllerProvider: DetailViewControllerProvider
    
    init(navigationController: UINavigationController,
         detailViewControllerProvider: DetailViewControllerProvider) {
        self.navigationController = navigationController
        self.detailViewControllerProvider = detailViewControllerProvider
    }
}

extension PushDetailNavigator: DetailNavigator {
    func navigateToShow(withIdentifier identifier: Int64) {
        let detailViewController = detailViewControllerProvider.showViewController(withIdentifier: identifier)
        navigationController.pushViewController(detailViewController, animated: true)
    }
    
    func navigateToMovie(withIdentifier identifier: Int64) {
        let detailViewController = detailViewControllerProvider.movieViewController(withIdentifier: identifier)
        navigationController.pushViewController(detailViewController, animated: true)
    }
}
