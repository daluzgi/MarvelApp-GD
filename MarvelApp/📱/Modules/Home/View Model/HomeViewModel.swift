//
//  HomeViewModel.swift
//  MarvelApp
//
//  Created by Gigi on 5/22/23.
//

import Foundation

class HomeViewModel {
    
    func loadComics() {
        HomeAPIClient.loadComics()
    }
}
