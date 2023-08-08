//
//  ComicsByCharacterModel.swift
//  MarvelApp
//
//  Created by Gigi on 8/5/23.
//

import Foundation

struct ComicsByCharacterModel: HomeItem {
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
