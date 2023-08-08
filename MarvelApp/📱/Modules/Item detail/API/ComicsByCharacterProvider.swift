//
//  ComicsByCharacterProvider.swift
//  MarvelApp
//
//  Created by Gigi on 8/5/23.
//

import Foundation

protocol ComicsByCharacterProviderProtocol {
    static func getComicsByCharacter(characterId: Int, result: @escaping (Result<ComicsByCharacterResponse, APIServiceError>) -> Void)
}

class ComicsByCharacterProvider: ComicsByCharacterProviderProtocol {
    
    static func getComicsByCharacter(characterId: Int, result: @escaping (Result<ComicsByCharacterResponse, APIServiceError>) -> Void) {
        
        let comicsByCharacter = MarvelAPIClient.baseURL + "/characters/\(characterId)/comics"
        guard let url = URL(string: comicsByCharacter) else { return }
       return MarvelAPIClient.fetchResources(url: url, completion: result)
    }
}

