//
//  CharacterDetailViewController.swift
//  MarvelApp
//
//  Created by Gigi on 6/6/23.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
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

        // Do any additional setup after loading the view.
    }


}
