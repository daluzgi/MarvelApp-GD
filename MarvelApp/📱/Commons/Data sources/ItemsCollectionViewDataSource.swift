//
//  ComicsCollectionViewDataSource.swift
//  MarvelApp
//
//  Created by Gigi on 6/22/23.
//

import Foundation
import UIKit

protocol ItemsCollectionViewDelegate {
    func didSelectComicAt(indexPath: IndexPath)
}

class ItemsCollectionViewDataSource: NSObject {
    var comics: [ComicsModel] = []
    var delegateComics: ItemsCollectionViewDelegate?
}

//MARK: - CollectionView

extension ItemsCollectionViewDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comics.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath) as? ItemCollectionViewCell else { return UICollectionViewCell() }

        cell.setupCell(comic: comics[indexPath.row])
        return cell
    }
}

extension ItemsCollectionViewDataSource: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Do whatever you need when the user taps on the cell
        delegateComics?.didSelectComicAt(indexPath: indexPath)
    }
}

extension ItemsCollectionViewDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
        
    }
}
