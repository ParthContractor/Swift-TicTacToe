//
//  TicTacToeVC.swift
//  TicTacToe
//
//  Created by Parth on 11/09/19.
//  Copyright © 2019 Parth. All rights reserved.
//

import UIKit

class TicTacToeVC: UIViewController{
   
    // MARK: - Initial Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.TicTacToeThemeColor.backgroundColorShade

        //Logically tic tac toe (1*1) will always result in a draw situation..
        //Logically tic tac toe (2*2) will always allow Player1 to win..
        //Because of these reasons, let's allow numberOfSquares > 2 only..
        if numberOfSquares <= 2 {
            fatalError("Logical-Constraint->Minimum 3 number of squares required for standard 2 player Tic Tac Toe setup")
        }
        title = "Amex - Tic Tac Toe"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "RESET", style: .plain, target: self, action: #selector(TicTacToeVC.resetTapped))
        ticTacToeBoardSetUp()
    }
    
    // MARK: - Board UI Rendering setup(Programattic algorithm including initial store(board state) setup(with default 0))
    private func ticTacToeBoardSetUp() {
        var row = startRowColumnIndex
        var column = startRowColumnIndex
        var originX: CGFloat = 0
        var originY: CGFloat = 150
        let spacingBetweenColumns: CGFloat = (screenWidth - (CGFloat(numberOfSquares) * squareWidthHeight)) / (CGFloat(numberOfSquares) - 1)
        let spacingBetweenRows: CGFloat = minimumSpacingRequiredBetweenColumns
        
        let remainingSpace: CGFloat = screenWidth - ((CGFloat(numberOfSquares) * squareWidthHeight) + (minimumSpacingRequiredBetweenColumns * (CGFloat(numberOfSquares) - 1)))

        //Need to make sure squares are tappable/User expereince consideration based on screen limit hence need to restrict somewhere
        if spacingBetweenColumns < minimumSpacingRequiredBetweenColumns {
            fatalError("UI(ScreenSize)-Constraint->Cannot accomodate \(numberOfSquares) number of squares")
        }
        else{
            originX = remainingSpace / 2
        }

        var rowArray = [Int]()//This will be each row array that needs to be appended to main 2D array from TicTacToeStore
        for i in 1...(numberOfSquares*numberOfSquares) {
            let btn = TicTacToeSquareButton()
            btn.tag = i
            btn.position = Position(row: row, column: column)
            btn.frame = CGRect.init(x: originX, y: originY, width: squareWidthHeight, height: squareWidthHeight)
            
            btn.addTarget(self, action: #selector(TicTacToeVC.squareTapped), for: .touchUpInside)

            //logic to switch to next column(item) in given row
            originX = originX + squareWidthHeight + minimumSpacingRequiredBetweenColumns
            self.view.addSubview(btn)
            
            //column seperator line logic(remove if not required)
            let columnSeperator = UIView.init(frame: CGRect.init(x: originX - (minimumSpacingRequiredBetweenColumns/2) - (seperatorLineWidth/2), y: originY - minimumSpacingRequiredBetweenColumns, width: seperatorLineWidth, height: squareWidthHeight + (minimumSpacingRequiredBetweenColumns*2)))
            columnSeperator.backgroundColor = UIColor.TicTacToeThemeColor.seperatorColor

            column = column + 1
            rowArray.append(0)
            if i % numberOfSquares == 0 {//logic to switch to next row in grid
                
                //This will update the 2D array with initial default(0)
                TicTacToeStore.setupStore(rowArray)
                rowArray = [Int]()//for next row iteration
                
                column = startRowColumnIndex
                row = row + 1
                originX = remainingSpace / 2
                originY = originY + spacingBetweenRows + squareWidthHeight
                
                //row seperator line logic(remove if not required)
                let rowSeperator = UIView.init(frame: CGRect.init(x: originX - spacingBetweenRows, y: originY - (spacingBetweenRows/2), width:(CGFloat(numberOfSquares) * squareWidthHeight) + (minimumSpacingRequiredBetweenColumns * (CGFloat(numberOfSquares) - 1)) + spacingBetweenRows*2, height: seperatorLineWidth))
                rowSeperator.backgroundColor = UIColor.TicTacToeThemeColor.seperatorColor
                if row < numberOfSquares {
                    self.view.addSubview(rowSeperator)
                }
            }
            else{
                self.view.addSubview(columnSeperator)//logic to avoid seperator after last column
            }
        }
    }
    
    // MARK: - Actions/Events
    @objc func squareTapped(_ sender: TicTacToeSquareButton) {
        sender.isSelected = true
        print("square position is \(sender.position.description)")
        TicTacToeStore.playerMoveUpdate(sender.position)
        self.title = "NEXT-Player\(TicTacToeNextMove.player)"
    }
    
    @objc func resetTapped() {
        view.removeAllSubviews()
        TicTacToeNextMove.player = .Player1
        TicTacToeStore.clear()
        ticTacToeBoardSetUp()
        self.title = "Amex - Tic Tac Toe"
    }

}
