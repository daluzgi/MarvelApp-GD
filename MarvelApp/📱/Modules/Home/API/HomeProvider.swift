//
//  APIClient.swift
//  MarvelApp
//
//  Created by Gigi on 5/22/23.
//

import Foundation

protocol HomeProviderProtocol {
    static func getCharacters(result: @escaping (Result<MarvelCharactersResponse, APIServiceError>) -> Void)
    static func getComics(result: @escaping (Result<ComicsResponse, APIServiceError>) -> Void)
}

class HomeProvider: HomeProviderProtocol {
    
    private enum Domain {
        static let getCharacters = MarvelAPIClient.baseURL + "/characters"
        static let getComics = MarvelAPIClient.baseURL + "/comics"
    }
    
    static func getCharacters(result: @escaping (Result<MarvelCharactersResponse, APIServiceError>) -> Void) {
        guard let url = URL(string: Domain.getCharacters) else { return }
       return MarvelAPIClient.fetchResources(url: url, completion: result)
    }
    
    static func getComics(result: @escaping (Result<ComicsResponse, APIServiceError>) -> Void) {
        guard let url = URL(string: Domain.getComics) else { return }
       return MarvelAPIClient.fetchResources(url: url, completion: result)
    }
}
