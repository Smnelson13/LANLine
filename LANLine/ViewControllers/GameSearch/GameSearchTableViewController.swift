//
//  GameSearchTableViewController.swift
//  LANLine
//
//  Created by Shane Nelson on 10/3/18.
//  Copyright © 2018 Shane Nelson. All rights reserved.
//

import UIKit

class GameSearchTableViewController: UITableViewController {
    
    var gamesArray = [Game]()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchControllerSetup()
        self.tableView.separatorColor = UIColor.clear
    }

}


// MARK: - Table view data source
extension GameSearchTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gamesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameSearchCell", for: indexPath) as! GameSearchTableViewCell
        
        return cell
    }
}


// MARK: - Search functionality
extension GameSearchTableViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text, !searchText.isEmpty {
            
        }
    }
      
    func searchControllerSetup() {
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.searchBar.delegate = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Game Search"
        navigationItem.searchController = search
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}

