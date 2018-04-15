//
//  Page.swift
//  TMDbCore
//
//  Created by Sergio Cabrera Hernández on 15/4/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation

// Otra alternativa de definición con varios protocolos (Generic Constraints)
// Se pueden mezclar
// struct Page<Element>: Decodable & CustomReflectable>: Decodable  {
// struct Page<Element>: Decodable where Element: Hashable  {

struct Page<Element: Decodable>: Decodable {
    let page: Int
    let totalPages: Int
    let totalResults: Int
    let results: [Element]
    
    // Para mapear los nombres de las propiedades de Page con las devueltas por la API
    private enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
