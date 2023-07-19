//
//  HomeCollectionViewDataSource.swift
//  MarvelApp
//
//  Created by Gigi on 6/6/23.
//

import Foundation
import UIKit

protocol CharactersCollectionViewDelegate {
    func didSelectItemAt(indexPath: IndexPath)
}

class CharactersCollectionViewDataSource: NSObject {
    var characters: [CharacterModel] = []
    var delegate: CharactersCollectionViewDelegate?
}

//MARK: - CollectionView

extension CharactersCollectionViewDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }

        cell.setupCell(character: characters[indexPath.row])
        return cell
    }
}

extension CharactersCollectionViewDataSource: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Do whatever you need when the user taps on the cell
        delegate?.didSelectItemAt(indexPath: indexPath)
    }
}

extension CharactersCollectionViewDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
        
    }
}
