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
    var cornerRadius: CGFloat = 5.0

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .lightGray
    }
    
    func setupCell(character: CharacterModel) {
        nameLabel.text = character.title ?? "No title"
        
        if let thumbnail = character.thumbnail,
           let imageURL = ImageHelper.getImageURL(thumbnail: thumbnail) {
            imageViewCell.loadImage(at: imageURL, placeholder: nil)
        } else {
            imageViewCell.image = UIImage(named: "logo")
        }
    }
    
    func setupCell(comic: ComicsModel) {
        nameLabel.text = comic.title ?? "No title"

        if let thumbnail = comic.thumbnail,
           let imageURL = ImageHelper.getImageURL(thumbnail: thumbnail) {
            imageViewCell.loadImage(at: imageURL, placeholder: nil)
        } else {
            imageViewCell.image = UIImage(named: "logo")
        }
    }
}


