//
//  Game.swift
//  LANLine
//
//  Created by Shane Nelson on 10/7/18.
//  Copyright © 2018 Shane Nelson. All rights reserved.
//

import Foundation

struct Game {
    let platforms: [Int]?
    let release_date: Int
    let id: Int
    let name: String
    var coverUrl: String = ""
    var screenshotUrls = [String]()
    var summary = ""
}
