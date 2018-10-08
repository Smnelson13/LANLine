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


extension GameSearchTableViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
      
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let search = searchBar.text, search != "" {
            APIController.shared.fetchGenericGameData(urlString: "https://api-2445582011268.apicast.io/games/?search=\(search.replacingOccurrences(of: " ", with: "%20"))") { (games: [Game]) in
                games.forEach({ game in
                    self.gamesArray.append(game)
                })
            }
        }
    }
      
    func searchControllerSearch(_ searchText: String) {
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
