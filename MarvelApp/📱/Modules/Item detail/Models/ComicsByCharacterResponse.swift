//
//  ComicsByCharacterResponse.swift
//  MarvelApp
//
//  Created by Gigi on 8/5/23.
//

import Foundation

struct ComicsByCharacterResponse: Decodable {
    let attributionText: String?
    let data: ComicsByCharacterData?
}

struct ComicsByCharacterData: Pagination, Decodable {
    var offset: Int?
    var limit: Int?
    var total: Int?
    var count: Int?
    let results: [ComicsModel]?
}
