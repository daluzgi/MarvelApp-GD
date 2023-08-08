//
//  ComicsByCharacterProvider.swift
//  MarvelApp
//
//  Created by Gigi on 8/5/23.
//

import Foundation

protocol ComicsByCharacterProviderProtocol {
    static func getComicsByCharacter(result: @escaping (Result<ComicsByCharacterResponse, APIServiceError>) -> Void)
}

class ComicsByCharacterProvider: ComicsByCharacterProviderProtocol {
    
    private enum Domain {
        static let getComicsByCharacter = MarvelAPIClient.baseURL + "/characters/{characterId}/comics"
    }
    
    static func getComicsByCharacter(result: @escaping (Result<ComicsByCharacterResponse, APIServiceError>) -> Void) {
        guard let url = URL(string: Domain.getComicsByCharacter) else { return }
       return MarvelAPIClient.fetchResources(url: url, completion: result)
    }
}

