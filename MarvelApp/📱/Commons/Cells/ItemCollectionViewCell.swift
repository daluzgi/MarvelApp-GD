//
//  ItemCollectionViewCell.swift
//  MarvelApp
//
//  Created by Gigi on 5/22/23.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var nameLabel: UILabel!    
    @IBOutlet private weak var imageViewCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        imageViewCell.layer.cornerRadius = 8.0
        imageViewCell.clipsToBounds = true
    }
    
    func setupCell(character: CharacterModel) {
        nameLabel.text = character.title
        
        if let thumbnail = character.thumbnail,
           let imageURL = ImageHelper.getImageURL(thumbnail: thumbnail) {
            imageViewCell.loadImage(at: imageURL, placeholder: nil)
        }
    }
    
    func setupCell(comic: ComicsModel) {
        nameLabel.text = comic.title

        if let thumbnail = comic.thumbnail,
           let imageURL = ImageHelper.getImageURL(thumbnail: thumbnail) {
            imageViewCell.loadImage(at: imageURL, placeholder: nil)
        }
    }
}


