//
//  CharactersResponse.swift
//  MarvelApp
//
//  Created by Gigi on 5/24/23.
//

import Foundation

struct CharacterModel: HomeItem {
    var id: Int?
    var title: String?
    var description: String?
    var thumbnail: Thumbnail?
    var comics: CharacterComic?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title = "name"
        case description
        case thumbnail
        case comics
    }
}

struct CharacterComic: Decodable {
    let available: Int?
    let collectionURI: String?
}

struct Thumbnail: Decodable {
    let path: String?
    let format: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        //this coding key was changed because the word "extension" is a Swift keyword
        case format = "extension"
    }
}
