//
//  FeaturedPresenterTests.swift
//  TMDbCoreTests
//
//  Created by Sergio Cabrera Hernández on 14/4/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import XCTest
@testable import TMDbCore

class FeaturedPresenterTests: XCTestCase {
    // Cualquier variable de clase declarada aquí se resetean al inicio de cada test (no hace falta en setup)
    private var sut: FeaturedPresenter!  // sut = System Under Test
    
    // Collaborators
    private let featuredViewMock = FeaturedViewMock()
    private let detailNavigatorMock = DetailNavigatorMock()
    
    override func setUp() {
        super.setUp()
        sut = FeaturedPresenter(detailNavigator: detailNavigatorMock)
        sut.view = featuredViewMock
    }
    
    func test_didLoad_setHeaderTitles(){
        // when
        sut.didLoad()
        
        // then
        XCTAssertEqual(featuredViewMock.setShowHeraderTitleCalls.count, 1)
        XCTAssertEqual(featuredViewMock.setShowHeraderTitleCalls.first, NSLocalizedString("ON TV", comment: ""))
        XCTAssertEqual(featuredViewMock.setMoviesHeaderTitleCalls.count, 1)
        XCTAssertEqual(featuredViewMock.setMoviesHeaderTitleCalls.first, NSLocalizedString("IN THEATERS", comment: ""))
    }
    
    func testShow_didSelectShow_navigatesToShow() {
        // given
        let show = Show(identifier: 42,
                        title: "Test",
                        posterPath: nil,
                        backdropPath: nil,
                        firstAirDate: nil,
                        genreIdentifiers: [])
        
        // when
        sut.didSelect(show: show)
        
        // then
        XCTAssertEqual(detailNavigatorMock.navigateToShowCalls.count, 1)
        XCTAssertEqual(detailNavigatorMock.navigateToShowCalls.first, show.identifier)
    }
    
    func testMovie_didSelectMovie_navigatesToMovie() {
        // given
        let movie = Movie(identifier: 42,
                          title: "Test",
                        posterPath: nil,
                        backdropPath: nil,
                        releaseDate: nil,
                        genreIdentifiers: [])
        
        // when
        sut.didSelect(movie: movie)
        
        // then
        XCTAssertEqual(detailNavigatorMock.navigateToMovieCalls.count, 1)
        XCTAssertEqual(detailNavigatorMock.navigateToMovieCalls.first, movie.identifier)
    }
}
