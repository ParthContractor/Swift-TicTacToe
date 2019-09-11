//
//  Player.swift
//  TicTacToe
//
//  Created by Parth on 11/09/19.
//  Copyright © 2019 Parth. All rights reserved.
//

import Foundation

enum Player: Int {
    case Player1 = 1
    case Player2 = 2
    
    func getSymbol() -> String {
        if self.rawValue == 1 {
            return player1SelectionSymbol
        }
        else{
            return player2SelectionSymbol
        }
    }
}
