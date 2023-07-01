//
//  ComicsModel.swift
//  MarvelApp
//
//  Created by Gigi on 6/22/23.
//

import Foundation

struct ComicsModel: HomeItem {
    var id: Int?
    var title: String?
    var description: String?
    var thumbnail: Thumbnail?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case thumbnail
    }
}



