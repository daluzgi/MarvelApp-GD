//
//  ImageHelper.swift
//  MarvelApp
//
//  Created by Gigi on 5/31/23.
//

import Foundation

class ImageHelper {
    
    /// Get image url for Marvel Items.
    /// - Note: Set image from URL taking the path and extension to make the URL
    static func getImageURL(thumbnail :Thumbnail?) -> URL? {
        guard let path = thumbnail?.path,
              let format = thumbnail?.format,
              let imageURL = URL(string: path + "." + format) else { return nil }
        
        return imageURL
    }
    
}
