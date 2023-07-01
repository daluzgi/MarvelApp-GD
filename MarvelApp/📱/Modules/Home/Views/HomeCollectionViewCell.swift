//
//  HomeCollectionViewCell.swift
//  MarvelApp
//
//  Created by Gigi on 5/22/23.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var nameLabel: UILabel!    
    @IBOutlet private weak var imageViewCharacter: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func setupCell(character: CharacterModel) {
        nameLabel.text = character.title
        
        if let thumbnail = character.thumbnail,
           let imageURL = ImageHelper.getImageURL(thumbnail: thumbnail) {
            imageViewCharacter.loadImage(at: imageURL, placeholder: nil)
        }
    }
    
    func setupCell(comic: ComicsModel) {
        nameLabel.text = comic.title

        if let thumbnail = comic.thumbnail,
           let imageURL = ImageHelper.getImageURL(thumbnail: thumbnail) {
            imageViewCharacter.loadImage(at: imageURL, placeholder: nil)
        }
    }
    
}


