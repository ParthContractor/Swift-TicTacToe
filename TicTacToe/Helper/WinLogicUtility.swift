//
//  WinLogicUtility.swift
//  TicTacToe
//
//  Created by Parth on 11/09/19.
//  Copyright © 2019 Parth. All rights reserved.
//

import Foundation

struct WinLogicUtility{
    static func checkIfPlayerWins(_ position: Position) -> Bool{
        //Row check
        let fullRowSelectedByThisPlayer = TicTacToeStore.boardMappingArray[position.row].allSatisfy { $0 == position.player!.rawValue }

        return fullRowSelectedByThisPlayer
        
        //Column check
        let fullColumnSelectedByThisPlayer = TicTacToeStore.boardMappingArray[column: position.column].allSatisfy { $0 == position.player!.rawValue }
        
        return fullColumnSelectedByThisPlayer

        //diagonals check
    }
}
