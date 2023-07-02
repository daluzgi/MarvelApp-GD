//
//  ComicDetailViewController.swift
//  MarvelApp
//
//  Created by Gigi on 7/1/23.
//

import UIKit

class ComicDetailViewController: UIViewController {

    @IBOutlet weak var comicDetailTitle: UILabel!
    @IBOutlet weak var comicDetailsDescription: UILabel!
    @IBOutlet weak var comicDetailImage: UIImageView!
    
    private let viewModel = ComicDetailViewModel()
    let comic: ComicsModel?
    
    init(comic: ComicsModel) {
        self.comic = comic
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.comic = nil
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpComicDetail()

    }
    
    func setUpComicDetail() {
        comicDetailTitle.text = comic?.title
        
        if comic?.description == "" {
            comicDetailsDescription.text = "Comic description is not available"
        } else {
        comicDetailsDescription.text = comic?.description
        }
        
        if let thumbnail = comic?.thumbnail,
           let imageURL = ImageHelper.getImageURL(thumbnail: thumbnail) {
            comicDetailImage.loadImage(at: imageURL, placeholder: nil)
        }
    }

    
    
    
    
    
}
