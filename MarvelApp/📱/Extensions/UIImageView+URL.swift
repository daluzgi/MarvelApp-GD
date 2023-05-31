//
//  UIImageView+URL.swift
//  MarvelApp
//
//  Created by Gigi on 5/31/23.
//

import UIKit

extension UIImageView {
    func loadImage(at url: URL, placeholder: UIImage? = nil) {
      UIImageLoader.loader.load(url, for: self, placeholder: placeholder)
  }

  func cancelImageLoad() {
    UIImageLoader.loader.cancel(for: self)
  }
}
