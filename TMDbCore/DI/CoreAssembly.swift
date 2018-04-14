//
//  CoreAssembly.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 13/04/2018.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import UIKit



final public class CoreAssembly {
    // private(set) Indica que el setter es privado
    private(set) lazy var detailAssembly = DetailAssembly(navigationController: navigationController,
                                                          imageLoadingAssembly: imageLoadingAssembly)
    public private(set) lazy var featuredAssembly = FeaturedAssembly(detailAssembly: detailAssembly,
                                                                     imageLoadingAssembly: imageLoadingAssembly)
	private(set) lazy var searchAssembly = SearchAssembly(imageLoadingAssembly: imageLoadingAssembly)
	private(set) lazy var imageLoadingAssembly = ImageLoadingAssembly(webServiceAssembly: webServiceAssembly)
	private(set) lazy var webServiceAssembly = WebServiceAssembly()

	private let navigationController: UINavigationController

	public init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
}
