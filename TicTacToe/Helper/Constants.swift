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

let numberOfSquares = 10//This is to determine how many squares needs to be considered for a tic tac toe board
//For iPhone 5s-->4 is a good maximum number for rendering
//For iPhone x/max-->6 is a good maximum for rendering
//For iPads 9.7/ipad air-->10 is a good maximum number to render proper UI
//For iPads 12.9-->15 is a good maximum number to render proper UI

let squareWidthHeight: CGFloat = 50//This is is considered to be a safe(tappable) area hence taken square dimension accordingly..

let minimumSpacingRequiredBetweenColumns: CGFloat = 17.5//This is the minimum spacing we have taken into consideration for a standard/decent looking UI of a tic tac toe board..

let startRowColumnIndex = 0

let seperatorLineWidth: CGFloat = 3

let player1SelectionSymbol = "X"
let player2SelectionSymbol = "O"

let defaultNavigationTitle = "Amex - Tic Tac Toe"

let defaultValueInitialBoardState = 0//default cannot be Player enum values(1 or 2) because they are used for its selection logic in board state
