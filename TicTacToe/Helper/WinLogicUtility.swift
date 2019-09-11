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
        if fullRowSelectedByThisPlayer {
            return true
        }
        
        //Column check
        let fullColumnSelectedByThisPlayer = TicTacToeStore.boardMappingArray[column: position.column].allSatisfy { $0 == position.player!.rawValue }
        if fullColumnSelectedByThisPlayer {
            return true
        }
        
        //Primary diagonal.. check
        var primaryDiagonalArray = [Int]()
        for index in 0..<numberOfSquares {
            primaryDiagonalArray.append(TicTacToeStore.boardMappingArray[index][index])
        }
        let fullPrimaryDiagonalSelectedByThisPlayer = primaryDiagonalArray.allSatisfy { $0 == position.player!.rawValue }
        if fullPrimaryDiagonalSelectedByThisPlayer {
            return true
        }
        
        //Anti-diagonal.. check
        var antiDiagonalArray = [Int]()
        for index in 0..<numberOfSquares {
            antiDiagonalArray.append(TicTacToeStore.boardMappingArray[index][numberOfSquares - index - 1])
        }
        let fullAntiDiagonalSelectedByThisPlayer = antiDiagonalArray.allSatisfy { $0 == position.player!.rawValue }
        if fullAntiDiagonalSelectedByThisPlayer {
            return true
        }
        
        return false
    }
}
