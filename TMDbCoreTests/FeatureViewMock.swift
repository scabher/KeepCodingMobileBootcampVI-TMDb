//
//  FeatureViewMock.swift
//  TMDbCoreTests
//
//  Created by Sergio Cabrera Hernández on 14/4/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation
@testable import TMDbCore

final class FeaturedViewMock: FeaturedView {
    var setShowHeraderTitleCalls: [String] = []
    var setMoviesHeaderTitleCalls: [String] = []
    var updateWithShowsCalls: [[Show]] = []
    var updateWithMoviesCalls: [[Movie]] = []
    
    func setShowsHeaderTitle(_ title: String) {
        setShowHeraderTitleCalls.append(title)
    }
    
    func setMoviesHeaderTitle(_ title: String) {
        setMoviesHeaderTitle(title)
    }
    
    func update(with shows: [Show]) {
        updateWithShowsCalls.append(shows)
    }
    
    func update(with movies: [Movie]) {
        updateWithMoviesCalls.append(movies)
    }
}
