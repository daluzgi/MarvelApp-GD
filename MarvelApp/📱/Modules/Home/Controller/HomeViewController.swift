//
//  HomeViewController.swift
//  MarvelApp
//
//  Created by Gigi on 5/22/23.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var CharactersCollectionView: UICollectionView!
    @IBOutlet weak var ComicsCollectionView: UICollectionView!
    
    let viewModel = HomeViewModel()
    
    fileprivate var characters: [CharacterModel] = []
    fileprivate var charactersCollectionViewDataSource = CharactersCollectionViewDataSource()
    
    fileprivate var comics: [ComicsModel] = []
    fileprivate var comicsCollectionViewDataSource = ComicsCollectionViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        loadCharacters()
        loadComics()
        
        self.title = "Marvel"
    }
    
    private func setupCollectionView() {
        
        let nibName = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
        CharactersCollectionView.register(nibName, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        ComicsCollectionView.register(nibName, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        
        charactersCollectionViewDataSource.delegate = self
        CharactersCollectionView.delegate = charactersCollectionViewDataSource
        CharactersCollectionView.dataSource = charactersCollectionViewDataSource
        
        comicsCollectionViewDataSource.delegateComics = self
        ComicsCollectionView.delegate = comicsCollectionViewDataSource
        ComicsCollectionView.dataSource = comicsCollectionViewDataSource
    }
    
    
    func loadCharacters() {
        viewModel.loadCharacters { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let charactersResponse):
                DispatchQueue.main.async {
                    self.characters = charactersResponse.data?.results ?? []
                    self.charactersCollectionViewDataSource.characters = self.characters
                    self.CharactersCollectionView.reloadData()
                }
            case .failure(let error):
                print("Get characteres data has failed from Marvel API")
            }
        }
        
    }
    
    func loadComics() {
        viewModel.loadComics() { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let comicsResponse):
                DispatchQueue.main.async {
                    self.comics = comicsResponse.data?.results ?? []
                    self.comicsCollectionViewDataSource.comics = self.comics
                    self.ComicsCollectionView.reloadData()
                }
            case .failure(let error):
                print("Get comics data has failed from Marvel API")
            }
        }
        
    }
    
}

extension HomeViewController: CharactersCollectionViewDelegate {
    func didSelectItemAt(indexPath: IndexPath) {
        guard let navigation = navigationController else {
            return
        }
        
        viewModel.showCharacterDetail(character: characters[indexPath.row], navigationController: navigation)
    }
}

extension HomeViewController: ComicsCollectionViewDelegate {
//    func didSelectItemAt(indexPath: IndexPath) {
//        guard let navigation = navigationController else {
//            return
//        }
//
//        viewModel.showComicDetail(comic: comics[indexPath.row], navigationController: navigation)
//    }
}
