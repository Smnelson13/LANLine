//
//  GameSearchStore.swift
//  LANLine
//
//  Created by Shane Nelson on 11/1/18.
//  Copyright © 2018 Shane Nelson. All rights reserved.
//

import Foundation

final class GameSearchStore: GameSearchDelegate {
    
    func getSearchResults(searchTerm: String) {
        APIController.shared.getTopLevelCollection(urlString: "https://api-2445582011268.apicast.io/games/?search=\(searchTerm.removeWhitespace)")
    }
}
