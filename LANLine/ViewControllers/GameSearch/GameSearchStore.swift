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
        APIController.shared.getTopLevelCollection(urlString: "https://api-endpoint.igdb.com/games/?search=\(searchTerm.removeWhitespace())&fields=name,screenshots,popularity&order=popularity:desc", onSuccess: { game in
            for i in game {
                print(i.id)
            }
        }, onError: { error in
            print(error)
        })
    }
}
