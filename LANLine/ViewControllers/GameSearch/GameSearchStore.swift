//
//  GameSearchStore.swift
//  LANLine
//
//  Created by Shane Nelson on 11/1/18.
//  Copyright © 2018 Shane Nelson. All rights reserved.
//

import Foundation

final class GameSearchStore: GameSearchDelegate {
    
    var searchGameTableView = GameSearchTableViewController()
    
    init() {
        searchGameTableView.delegate = self
    }
    
    func getSearchResults(searchTerm: String) {
        APIController.shared.getTopLevelCollection(urlString: "https://api-2445582011268.apicast.io/games/?search=\(searchTerm.removeWhitespace)", onSuccess: { results in
            print(results)
        }, onError: { error in
            print(error)
        })
    }
}
