//
//  File.swift
//  TicTacToe
//
//  Created by Parth on 11/09/19.
//  Copyright © 2019 Parth. All rights reserved.
//

import Foundation

struct Position {
    let row: Int
    let column: Int
    
    private(set) var player: Player?

    mutating func updatePlayer(_ player: Player){
        self.player = player
    }
}

extension Position {
    init(row: Int, column: Int) {
        self.row = row
        self.column = column
        self.player = nil
    }
}

extension Position: CustomStringConvertible {
    var description: String {
        if let plVal = player {
            return ("row is \(row) ; column is \(column) ; Position selected by player \(plVal)")
        }
        return ("row is \(row) ; column is \(column) ; Position intact without selecetion")
    }
}
