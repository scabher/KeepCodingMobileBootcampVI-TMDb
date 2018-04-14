//
//  WebServiceAssembly.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 26/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

// Esto se convertirá y usará como Singleton
final class WebServiceAssembly {
	private(set) lazy var webService = WebService(configuration: .default)
}
