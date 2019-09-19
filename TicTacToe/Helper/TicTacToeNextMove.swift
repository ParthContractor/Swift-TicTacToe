//
//  TicTacToeNextMove.swift
//  TicTacToe
//
//  Created by Parth on 11/09/19.
//  Copyright © 2019 Parth. All rights reserved.
//

import Foundation

struct TicTacToeNextMove {//TicTacToeNextMove.player global/static variable taken for tracking next move of a player(1 or 2)..By defult first player is considered to start a game
    //Player1 is taking 'X' and Player2 is taking 'O'
    static private(set) var player = Player.Player1
    
    static func updateNextTurnPlayer() {
        if TicTacToeNextMove.player == .Player1 {
            TicTacToeNextMove.player = .Player2
        }
        else{
            TicTacToeNextMove.player = .Player1
        }
    }
    
    static func resetMoveToStart() {
        TicTacToeNextMove.player = .Player1
    }
}
