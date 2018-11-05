//
//  Utils.swift
//  LANLine
//
//  Created by Shane Nelson on 11/1/18.
//  Copyright © 2018 Shane Nelson. All rights reserved.
//

import Foundation

extension String {
    func removeWhitespace() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
}
