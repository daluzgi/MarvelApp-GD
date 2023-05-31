//
//  UIFont+Marvel.swift
//  MarvelApp
//
//  Created by Gigi on 5/31/23.
//

import Foundation
import UIKit

public enum MarvelFontBase: CGFloat {
    case h1 = 32
    case h2 = 24
    case headline = 18
    case body = 16
    case captionOne = 14
    case captionTwo = 12
    case label = 10
    case small = 8
}

public struct MarvelFontCore {
    
    // MARK: - H1 font
    public var h1Regular: UIFont {
        return MarvelFontCore.font(.h1, style: .regular)
    }
    
    public var h1SemiBold: UIFont {
        return MarvelFontCore.font(.h1, style: .semiBold)
    }
    
    public var h1Bold: UIFont {
        return MarvelFontCore.font(.h1, style: .bold)
    }
    
    // MARK: - H2 font
    public var h2Regular: UIFont {
        return MarvelFontCore.font(.h2, style: .regular)
    }
    
    public var h2SemiBold: UIFont {
        return MarvelFontCore.font(.h2, style: .semiBold)
    }
    
    public var h2Bold: UIFont {
        return MarvelFontCore.font(.h2, style: .bold)
    }
    
    // MARK: - Headline font
    public var headlineRegular: UIFont {
        return MarvelFontCore.font(.headline, style: .regular)
    }
    
    public var headlineSemiBold: UIFont {
        return MarvelFontCore.font(.headline, style: .semiBold)
    }
    
    public var headlineBold: UIFont {
        return MarvelFontCore.font(.headline, style: .bold)
    }
    
    // MARK: - Body font
    public var bodyRegular: UIFont {
        return MarvelFontCore.font(.body, style: .regular)
    }
    
    public var bodySemiBold: UIFont {
        return MarvelFontCore.font(.body, style: .semiBold)
    }
    
    public var bodyBold: UIFont {
        return MarvelFontCore.font(.body, style: .bold)
    }
    
    // MARK: - Caption One font
    public var captionOneRegular: UIFont {
        return MarvelFontCore.font(.captionOne, style: .regular)
    }
    
    public var captionOneSemiBold: UIFont {
        return MarvelFontCore.font(.captionOne, style: .semiBold)
    }
    
    public var captionOneBold: UIFont {
        return MarvelFontCore.font(.captionOne, style: .bold)
    }
    
    // MARK: - Caption Two font
    public var captionTwoRegular: UIFont {
        return MarvelFontCore.font(.captionTwo, style: .regular)
    }
    
    public var captionTwoSemiBold: UIFont {
        return MarvelFontCore.font(.captionTwo, style: .semiBold)
    }
    
    public var captionTwoBold: UIFont {
        return MarvelFontCore.font(.captionTwo, style: .bold)
    }
    
    // MARK: - Label font
    public var labelRegular: UIFont {
        return MarvelFontCore.font(.label, style: .regular)
    }
    
    public var labelSemiBold: UIFont {
        return MarvelFontCore.font(.label, style: .semiBold)
    }
    
    public var labelBold: UIFont {
        return MarvelFontCore.font(.label, style: .bold)
    }
    
    public var smallSemiBold: UIFont {
        return MarvelFontCore.font(.small, style: .semiBold)
    }
}

public extension MarvelFontCore {
    
    static func font(_ font: MarvelFontBase, style: MarvelFontName) -> UIFont {
        switch style {
        case .regular:
            return UIFont.systemFont(ofSize: font.rawValue, weight: .regular)
        case .semiBold:
            return UIFont.systemFont(ofSize: font.rawValue, weight: .semibold)
        case .bold:
            return UIFont.systemFont(ofSize: font.rawValue, weight: .bold)
        }
    }
}

public enum MarvelFontName: String {
    case regular
    case bold
    case semiBold
}


