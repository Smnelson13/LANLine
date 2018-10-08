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
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        searchControllerSetup()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gamesArray.count
    }

}


    extension GameSearchTableViewController: UISearchResultsUpdating {
      func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
      }
      
      func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
      }
      
      func searchControllerSearch(_ searchText: String) {
        APIController.shared.fetchGenericData(urlString: searchText) { (games : [Game]) in
            games.forEach({ game in
                self.gamesArray.append(game)
                
                })
            }
        }
      
      func searchControllerSetup() {
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Type something here to search"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
      }
}
