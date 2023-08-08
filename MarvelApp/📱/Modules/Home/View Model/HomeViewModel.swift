//
//  HomeViewModel.swift
//  MarvelApp
//
//  Created by Gigi on 5/22/23.
//

import Foundation
import UIKit

class HomeViewModel {
    
    func loadCharacters(result: @escaping (Result<MarvelCharactersResponse, APIServiceError>) -> Void) {
        HomeProvider.getCharacters(result: result)
    }
    
    func loadComics(result: @escaping (Result<ComicsResponse, APIServiceError>) -> Void) {
        HomeProvider.getComics(result: result)
    }

    //show the module for Item detail
    func showCharacterDetail(character: CharacterModel, navigationController: UINavigationController) {
        let item = ItemDetailModel(title: character.title, description: character.description, thumbnail: character.thumbnail, characterID: character.id)
        let viewController = ItemDetailViewController(item: item)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showComicDetail(comic: ComicsModel, navigationController: UINavigationController) {
        let item = ItemDetailModel(title: comic.title, description: comic.description, thumbnail: comic.thumbnail, characterID: nil)
        let viewController = ItemDetailViewController(item: item)
        navigationController.pushViewController(viewController, animated: true)
    }
}
