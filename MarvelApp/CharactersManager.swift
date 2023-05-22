//
//  CharactersManager.swift
//  MarvelApp
//
//  Created by Gigi on 5/22/23.
//

import Foundation

protocol characterManagerDelegate {
    func displayListCharacters(list: [Character])
}

struct CharactersManager {
    var delegate: characterManagerDelegate?
    
    func displayCharacter() {
        let urlString = " "
        
        if let url + URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nill {
                print("Error getting data from Api."), error?.localizedDescription)
                }
                if let SafeData = data.parseData(quitarString: "null,")
                
                
            }
        }
    }
}
