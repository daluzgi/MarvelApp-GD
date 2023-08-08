//
//  ItemDetailViewModel.swift
//  MarvelApp
//
//  Created by Gigi on 6/6/23.
//

import Foundation

class ItemDetailViewModel {
    
    func getComics(characterID: Int, result: @escaping (Result<ComicsByCharacterResponse, APIServiceError>) -> Void) {
        ComicsByCharacterProvider.getComicsByCharacter(characterId: characterID, result: result)
    }
}
