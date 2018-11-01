//
//  GameSearchBrain.swift
//  LANLine
//
//  Created by Shane Nelson on 10/7/18.
//  Copyright © 2018 Shane Nelson. All rights reserved.
//

import Foundation

protocol GameSearchDelegate: Actions {
    func searchGame(searchTerm: String)
}

class GameSearchActions: GameSearchDelegate {
    
    func searchGame(searchTerm: String) {
        let search = searchTerm.replacingOccurrences(of: " ", with: "%20")
        let searchUrl = "https://api-2445582011268.apicast.io/games/?search=\(search)"
        APIController.shared.getGameSearch(urlString: searchUrl)
    }
}
