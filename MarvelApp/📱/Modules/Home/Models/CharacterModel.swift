//
//  DataCharacter.swift
//  MarvelApp
//
//  Created by Gigi on 5/22/23.
//

import Foundation

struct CharacterModel: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let path: String
}
