//
//  DetailNavigator.swift
//  TMDbCore
//
//  Created by Sergio Cabrera Hernández on 14/4/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation

protocol DetailNavigator {
    func navigateToShow(withIdentifier identifier: Int64)
    func navigateToMovie(withIdentifier identifier: Int64)
}
