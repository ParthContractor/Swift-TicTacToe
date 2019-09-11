//
//  Constants.swift
//  TicTacToe
//
//  Created by Parth on 11/09/19.
//  Copyright © 2019 Parth. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

let numberOfSquares = 3//This is to determine how many squares needs to be considered for a tic tac toe board
//For iPhone 5s-->5 is a good number to go for
//Mapping??Dynamic??

let squareWidthHeight: CGFloat = 50//This is is considered to be a safe(tappable) area hence taken square dimension accordingly..

let minimumSpacingRequiredBetweenColumns: CGFloat = 17.5//This is the minimum spacing we have taken into consideration for a standard/decent looking UI of a tic tac toe board..

let startRowColumnIndex = 0

let seperatorLineWidth: CGFloat = 3

let player1SelectionSymbol = "X"
let player2SelectionSymbol = "O"

let defaultNavigationTitle = "Amex - Tic Tac Toe"

let defaultValueInitialBoardState = 0//default cannot be Player enum values(1 or 2) because they are used for its selection logic in board state
