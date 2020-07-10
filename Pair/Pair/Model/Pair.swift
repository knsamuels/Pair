//
//  Pair.swift
//  Pair
//
//  Created by Kristin Samuels  on 7/10/20.
//  Copyright © 2020 Kristin Samuels . All rights reserved.
//

import Foundation

class Pair: Codable {
    var pairNumber: Int
    var nameOne: String
    var nameTwo: String
    
    init(pairNumber: Int, nameOne: String, nameTwo: String) {
        self.pairNumber = pairNumber
        self.nameOne = nameOne
        self.nameTwo = nameTwo
    }
}

extension Pair: Equatable {
    static func == (lhs: Pair, rhs: Pair) -> Bool {
        return lhs.pairNumber == rhs.pairNumber && lhs.nameOne == rhs.nameOne && lhs.nameTwo == rhs.nameTwo
    }
}
