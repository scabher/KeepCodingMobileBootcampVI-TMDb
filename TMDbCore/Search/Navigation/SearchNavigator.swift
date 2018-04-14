//
//  SearchNavigator.swift
//  TMDbCore
//
//  Created by Sergio Cabrera Hernández on 14/4/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import UIKit

final class SearchNavigator {
    private var searchController: UISearchController!
    private unowned let searchViewControllerProvider: SearchViewControllerProvider
    
    init(searchViewControllerProvider: SearchViewControllerProvider) {
        self.searchViewControllerProvider = searchViewControllerProvider
    }
    
    func installSearch(in viewController: UIViewController) {
        let searchViewController = searchViewControllerProvider.searchViewController()
        searchController = UISearchController(searchResultsController: searchViewController)
        
        searchController.searchResultsUpdater = searchViewController as? UISearchResultsUpdating
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = NSLocalizedString("Search movies, shows and peolple", comment: "")
        searchController.searchBar.searchBarStyle = .minimal
        
        viewController.navigationItem.titleView = searchController.searchBar
        viewController.definesPresentationContext = true
    }
}
