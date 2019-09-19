//
//  TicTacToeStore.swift
//  TicTacToe
//
//  Created by Parth on 11/09/19.
//  Copyright © 2019 Parth. All rights reserved.
//

import Foundation

struct TicTacToeStore {//In memory storage(2D array for board state management)
    static private(set) var boardMappingArray: [[Int]] = []//It will be populated with default 0 while initial boardSetUp
        
    static func setUpZeroStateStore(_ rowArray:[Int]){//2D array --> initial setup without any movements in game
        //By default 0 will be assigned to signify no player has selected the square yet !
        TicTacToeStore.boardMappingArray.append(rowArray)
    }
    
    static func playerMoveUpdate(_ selectedSquare: Position){
        guard let player = selectedSquare.player else {
            fatalError("Bad state(Developer Error)-->Please cross check if player is properly updated in Position associated after square selection")
        }
        //1 denotes player1 has selected that square
        //2 denotes player2 has selected that square
        TicTacToeStore.boardMappingArray[selectedSquare.row][selectedSquare.column] = player.rawValue
        selectedSquareCounter += 1//keep increasing counter for all selection so that it's easier to get final/full state for draw condition check..
    }
    
    static func clear(){//While resetting the board to start new game
        TicTacToeStore.boardMappingArray.removeAll()
    }
    
    static var selectedSquareCounter = 0//to check draw condition(full board state)
}

