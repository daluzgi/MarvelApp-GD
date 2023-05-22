//
//  ViewController.swift
//  MarvelApp
//
//  Created by Gigi on 5/21/23.
//

import UIKit

class ListCharactersViewController: UIViewController {
    
    //MARK: - IBOoutlets
    
    @IBOutlet weak var tablaCharacters: UITableView!
    @IBOutlet weak var searchBarCharacters: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablaCharacters.delegate = self
        tablaCharacters.dataSource = self
        
    }
}

// MARK: - Table

extension ListCharactersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tablaCharacters.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "IronMan"
        return cell
    }
    
    
    
}
