//
//  HomeViewController.swift
//  MarvelApp
//
//  Created by Gigi on 5/22/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let viewModel = HomeViewModel()
    fileprivate var characters: [CharacterModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        loadCharacters()
        
        self.title = "messi"

    }
    
    private func setupCollectionView() {
                let nibName = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
                collectionView.register(nibName, forCellWithReuseIdentifier: "HomeCollectionViewCell")
                
        //        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    func loadCharacters() {
        viewModel.loadCharacters { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let charactersResponse):
                DispatchQueue.main.async {
                    self.characters = charactersResponse.data?.results ?? []
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print("Get characteres data has failed from Marvel API")
            }
        }
        
    }
}

//MARK: - CollectionView

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }

        cell.setupCell(character: characters[indexPath.row])
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Do whatever you need when the user taps on the cell
        viewModel.showCharacterDetail()
    }
}
