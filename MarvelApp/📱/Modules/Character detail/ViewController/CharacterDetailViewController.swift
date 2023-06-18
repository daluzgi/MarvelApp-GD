//
//  CharacterDetailViewController.swift
//  MarvelApp
//
//  Created by Gigi on 6/6/23.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    private let viewModel = CharacterDetailViewModel()
    let character: CharacterModel?

    init(character: CharacterModel) {
        self.character = character
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.character = nil
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCharacterDetail()
        
    }
    
    func setupCharacterDetail() {
        titleLabel.text = character?.title
        
        if character?.description == "" {
            descriptionLabel.text = "Description not available"
        } else {
        descriptionLabel.text = character?.description
        }
        
        if let thumbnail = character?.thumbnail,
           let imageURL = ImageHelper.getImageURL(thumbnail: thumbnail) {
            characterImageView.loadImage(at: imageURL, placeholder: nil)
        }
    }
}

