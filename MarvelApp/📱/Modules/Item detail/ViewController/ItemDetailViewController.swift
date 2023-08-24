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
    let characterID: Int?
}

class ItemDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var itemCollectionView: UICollectionView!
    
    private let viewModel = ItemDetailViewModel()
    let item: ItemDetailModel?
    fileprivate var comics: [ComicsModel] = []
    fileprivate var itemCollectionViewDataSource = ItemsCollectionViewDataSource()

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
        getComics()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        
        let nibName = UINib(nibName: "ItemCollectionViewCell", bundle: nil)
        itemCollectionView.register(nibName, forCellWithReuseIdentifier: "ItemCollectionViewCell")
        
        //itemCollectionViewDataSource.delegateComics = self
        itemCollectionView.delegate = itemCollectionViewDataSource
        itemCollectionView.dataSource = itemCollectionViewDataSource
    
    }
    
    private func getComics() {
        if let characterID = item?.characterID {
            viewModel.getComics(characterID: characterID) { [weak self] result in
                guard let self = self else { return }
                
                switch result {
                case .success(let comicsByCharacterResponse):
                    DispatchQueue.main.async {
                        self.comics = comicsByCharacterResponse.data?.results ?? []
                        self.itemCollectionViewDataSource.comics = self.comics
                        self.itemCollectionView.reloadData()
                    }
                case .failure(let error):
                    print("Get comics by character ID data has failed from Marvel API")
                }
            }
        }
    }
    
    func setupItemDetail() {
        titleLabel.text = item?.title
        
        if item?.description == "" {
            descriptionLabel.text = "Description is not available"
        } else {
            descriptionLabel.text = item?.description
        }
        
        if let thumbnail = item?.thumbnail,
           let imageURL = ImageHelper.getImageURL(thumbnail: thumbnail) {
            itemImageView.loadImage(at: imageURL, placeholder: nil)
        }
    }
}

