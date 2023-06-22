//
//  HomeViewController.swift
//  MarvelApp
//
//  Created by Gigi on 5/22/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var comicsCollectionView: UICollectionView!
    
    let viewModel = HomeViewModel()
    fileprivate var characters: [CharacterModel] = []
    fileprivate var collectionViewDataSource = CharactersCollectionViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        loadCharacters()
        
        self.title = "Marvel"

    }
    
    private func setupCollectionView() {
                let nibName = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
                collectionView.register(nibName, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        
        collectionViewDataSource.delegate = self
        collectionView.delegate = collectionViewDataSource
        collectionView.dataSource = collectionViewDataSource
    }
    
    
    func loadCharacters() {
        viewModel.loadCharacters { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let charactersResponse):
                DispatchQueue.main.async {
                    self.characters = charactersResponse.data?.results ?? []
                    self.collectionViewDataSource.characters = self.characters
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print("Get characteres data has failed from Marvel API")
            }
        }
        
    }
}

extension HomeViewController: HomeCollectionViewDelegate {
    func didSelectItemAt(indexPath: IndexPath) {
        guard let navigation = navigationController else {
            return
        }
        
        viewModel.showCharacterDetail(character: characters[indexPath.row], navigationController: navigation)
    }
}
