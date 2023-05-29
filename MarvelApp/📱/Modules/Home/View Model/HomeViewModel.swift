//
//  HomeViewModel.swift
//  MarvelApp
//
//  Created by Gigi on 5/22/23.
//

import Foundation

class HomeViewModel {
    
    func loadCharacters(result: @escaping (Result<MarvelCharactersResponse, APIServiceError>) -> Void) {
        HomeProvider.getCharacters(result: result)
    }
    
    //Next Step
//    func loadComics() -> [CharacterModel] {
//    }
    
    func showCharacterDetail()  {
        //show the module for Character detail
    }
}
