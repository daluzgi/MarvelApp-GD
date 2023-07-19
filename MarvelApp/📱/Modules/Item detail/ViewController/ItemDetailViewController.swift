//
//  ItemDetailViewController.swift
//  MarvelApp
//
//  Created by Gigi on 6/6/23.
//

import UIKit

struct ItemDetailModel {
    let title: String?
    let description: String?
    let thumbnail: Thumbnail?
}

class ItemDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    private let viewModel = ItemDetailViewModel()
    let item: ItemDetailModel?

    init(item: ItemDetailModel) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.item = nil
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItemDetail()
        
    }
    
    func setupItemDetail() {
        titleLabel.text = item?.title
        
        if item?.description == "" {
            descriptionLabel.text = "Character description is not available"
        } else {
            descriptionLabel.text = item?.description
        }
        
        if let thumbnail = item?.thumbnail,
           let imageURL = ImageHelper.getImageURL(thumbnail: thumbnail) {
            itemImageView.loadImage(at: imageURL, placeholder: nil)
        }
    }
}

