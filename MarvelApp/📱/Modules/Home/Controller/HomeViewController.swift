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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        loadComics()

    }
    
    private func setupCollectionView() {
                let nibName = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
                collectionView.register(nibName, forCellWithReuseIdentifier: "HomeCollectionViewCell")
                
        //        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    func loadComics() {
        viewModel.loadComics()
        
    }
}

//MARK: - CollectionView

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath)

//        let data = data[indexPath.item]
//        cell.textLabel.text = String(data)
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Do whatever you need when the user taps on the cell
    }
}
