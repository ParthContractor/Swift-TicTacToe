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
        if fullRowSelectedByThisPlayer(position) {
            return true
        }
        
        //Column check
        if fullColumnSelectedByThisPlayer(position) {
            return true
        }
        
        //Primary diagonal.. check
        if fullPrimaryDiagonalSelectedByThisPlayer(position) {
            return true
        }
        
        //Anti-diagonal.. check
        if fullAntiDiagonalSelectedByThisPlayer(position) {
            return true
        }
        
        return false
    }
    
    private static func fullRowSelectedByThisPlayer(_ position: Position) -> Bool {
        return TicTacToeStore.boardMappingArray[position.row].allSatisfy { $0 == position.player!.rawValue }
    }
    
    private static func fullColumnSelectedByThisPlayer(_ position: Position) -> Bool {
        return TicTacToeStore.boardMappingArray[column: position.column].allSatisfy { $0 == position.player!.rawValue }
    }
    
    private static func fullPrimaryDiagonalSelectedByThisPlayer(_ position: Position) -> Bool {
        var primaryDiagonalArray = [Int]()
        for index in 0..<numberOfSquares {
            primaryDiagonalArray.append(TicTacToeStore.boardMappingArray[index][index])
        }
        return primaryDiagonalArray.allSatisfy { $0 == position.player!.rawValue }
    }
    
    private static func fullAntiDiagonalSelectedByThisPlayer(_ position: Position) -> Bool {
        var antiDiagonalArray = [Int]()
        for index in 0..<numberOfSquares {
            antiDiagonalArray.append(TicTacToeStore.boardMappingArray[index][numberOfSquares - index - 1])
        }
        return antiDiagonalArray.allSatisfy { $0 == position.player!.rawValue }
    }
}
