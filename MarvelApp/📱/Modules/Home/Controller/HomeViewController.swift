//
//  HomeViewController.swift
//  MarvelApp
//
//  Created by Gigi on 5/22/23.
//

import UIKit

class HomeViewController: UIViewController {

    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    func loadComics() {
        viewModel.loadComics()
    }


}
