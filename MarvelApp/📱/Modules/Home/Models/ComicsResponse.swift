//
//  ComicsResponse.swift
//  MarvelApp
//
//  Created by Gigi on 5/24/23.

import Foundation

struct ComicsResponse: Decodable {
    let attributionText: String?
    let data: ComicsData?
}

struct ComicsData: Pagination, Decodable {
    var offset: Int?
    var limit: Int?
    var total: Int?
    var count: Int?
    let results: [ComicsModel]?
}

//protocol Pagination: Decodable {
//    var offset: Int? { get set }
//    var limit: Int? { get set }
//    var total: Int? { get set }
//    var count: Int? { get set }
//}
//
//protocol HomeItem: Decodable {
//    var id: Int? { get set }
//    var title: String? { get set }
//    var description: String? { get set }
//    var thumbnail: Thumbnail? { get set }
//}
