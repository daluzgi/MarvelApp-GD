//
//  ComicsCollectionViewDataSource.swift
//  MarvelApp
//
//  Created by Gigi on 6/22/23.
//

import Foundation
import UIKit

protocol ComicsCollectionViewDelegate {
    func didSelectComicAt(indexPath: IndexPath)
}

class ComicsCollectionViewDataSource: NSObject {
    var comics: [ComicsModel] = []
    var delegateComics: ComicsCollectionViewDelegate?
}

//MARK: - CollectionView

extension ComicsCollectionViewDataSource: UICollectionViewDataSource {
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

extension ComicsCollectionViewDataSource: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Do whatever you need when the user taps on the cell
        delegateComics?.didSelectComicAt(indexPath: indexPath)
    }
}

extension ComicsCollectionViewDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
        
    }
}
