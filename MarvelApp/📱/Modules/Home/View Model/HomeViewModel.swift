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

    
    func showCharacterDetail(character: CharacterModel, navigationController: UINavigationController) {
        //show the module for Character detail
        let viewController = CharacterDetailViewController(character: character)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showComicDetail(comic: ComicsModel, navigationController: UINavigationController) {
        let viewController = ComicDetailViewController(comic: comic)
        navigationController.pushViewController(viewController, animated: true)
    }
}
