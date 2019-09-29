//
//  TicTacToeVC.swift
//  TicTacToe
//
//  Created by Parth on 11/09/19.
//  Copyright © 2019 Parth. All rights reserved.
//

import UIKit

typealias resetBoardSetupFunction = ()  -> Void

class TicTacToeVC: UIViewController,UITextFieldDelegate{
    static var numberOfSquaresForBoardSetup = numberOfSquares//This is to determine how many squares needs to be considered for a tic tac toe board based on user input from navigation bar textfield

    // MARK: - Initial Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.TicTacToeThemeColor.backgroundColorShade

        //Logically tic tac toe (1*1) will always result in a draw situation..
        //Logically tic tac toe (2*2) will always allow Player1 to win..
        //Because of these reasons, let's allow numberOfSquares > 2 only..
        if TicTacToeVC.numberOfSquaresForBoardSetup <= 2 {
            fatalError("Logical-Constraint->Minimum 3 number of squares required for standard 2 player Tic Tac Toe setup")
        }
        title = defaultNavigationTitle
        rightNavigationBarButtonsSetup()
        ticTacToeBoardSetUp()
    }
    
    private func rightNavigationBarButtonsSetup() {
        let textInput = UITextField()
        textInput.borderStyle = .roundedRect
        textInput.placeholder = "Enter number of squares of your choice for board setup"
        textInput.text = "\(TicTacToeVC.numberOfSquaresForBoardSetup)"
        textInput.textAlignment = .center
        textInput.textColor = .black
        textInput.font = UIFont.boldSystemFont(ofSize: 20)
        textInput.clearButtonMode = UITextField.ViewMode.whileEditing
        textInput.translatesAutoresizingMaskIntoConstraints = false
        textInput.keyboardType = .numberPad
        textInput.addTarget(self, action: #selector(TicTacToeVC.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        textInput.delegate = self
        let rightBarButtonItemWithTextInput = UIBarButtonItem.init(customView: textInput)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(title: "DONE", style: .plain, target: self, action: #selector(TicTacToeVC.resetTapped)), rightBarButtonItemWithTextInput]
    }
    
    // MARK: - Board UI Rendering setup(Programmatic algorithm including initial store(board state) setup(with default 0))
    private func ticTacToeBoardSetUp() {
        var row = startRowColumnIndex
        var column = startRowColumnIndex
        var originX: CGFloat = 0
        var originY: CGFloat = 150
        let spacingBetweenColumns: CGFloat = (screenWidth - (CGFloat(TicTacToeVC.numberOfSquaresForBoardSetup) * squareWidthHeight)) / (CGFloat(TicTacToeVC.numberOfSquaresForBoardSetup) - 1)
        let spacingBetweenRows: CGFloat = minimumSpacingRequiredBetweenColumns
        
        let remainingSpace: CGFloat = screenWidth - ((CGFloat(TicTacToeVC.numberOfSquaresForBoardSetup) * squareWidthHeight) + (minimumSpacingRequiredBetweenColumns * (CGFloat(TicTacToeVC.numberOfSquaresForBoardSetup) - 1)))

        //Need to make sure squares are tappable/User expereince consideration based on screen limit hence need to restrict somewhere
        if TicTacToeVC.numberOfSquaresForBoardSetup <= 2 {
            showAlertMessage("Oops..", "Logical-Constraint->Minimum 3 number of squares required for standard 2 player Tic Tac Toe setup", "OK", actionSelector: nil)
            return
        }
        else if spacingBetweenColumns < minimumSpacingRequiredBetweenColumns {
            showAlertMessage("Oops..", "UI(ScreenSize)-Constraint->Cannot accomodate \(TicTacToeVC.numberOfSquaresForBoardSetup) number of squares", "OK", actionSelector: nil)
            return
        }
        else{
            originX = remainingSpace / 2
        }

        var rowArray = [Int]()//This will be each row array that needs to be appended to main 2D array from TicTacToeStore
        for i in 1...(TicTacToeVC.numberOfSquaresForBoardSetup*TicTacToeVC.numberOfSquaresForBoardSetup) {
            let btn = TicTacToeSquareButton()
            btn.tag = i
            btn.position = Position(row: row, column: column)
            btn.frame = CGRect.init(x: originX, y: originY, width: squareWidthHeight, height: squareWidthHeight)
            btn.addTarget(self, action: #selector(TicTacToeVC.squareTapped), for: .touchUpInside)
            self.view.addSubview(btn)

            //logic to switch to next column(item) in given row..
            originX = originX + squareWidthHeight + minimumSpacingRequiredBetweenColumns
            
            //column seperator line logic(remove if not required)
            let columnSeperator = UIView.init(frame: CGRect.init(x: originX - (minimumSpacingRequiredBetweenColumns/2) - (seperatorLineWidth/2), y: originY - minimumSpacingRequiredBetweenColumns, width: seperatorLineWidth, height: squareWidthHeight + (minimumSpacingRequiredBetweenColumns*2)))
            columnSeperator.backgroundColor = UIColor.TicTacToeThemeColor.seperatorColor

            column = column + 1
            if defaultValueInitialBoardState == Player.Player1.rawValue || defaultValueInitialBoardState == Player.Player2.rawValue {
                fatalError("(Developer Error)-->Default cannot be same as player 1 or 2 raw value")
            }
            rowArray.append(defaultValueInitialBoardState)//initial setup(0) for each row in 2D array to manage board state
            
            if i % TicTacToeVC.numberOfSquaresForBoardSetup == 0 {//logic to switch to next row in grid
                //This will update the 2D array with initial default(0) for given row before switching to next one
                TicTacToeStore.setUpZeroStateStore(rowArray)
                rowArray = [Int]()//reset required for next row iteration..
                
                column = startRowColumnIndex//reset column for next row cycle..
                row = row + 1//increment row count..
                originX = remainingSpace / 2
                originY = originY + spacingBetweenRows + squareWidthHeight
                
                //row seperator line logic(remove if not required)
                let rowSeperator = UIView.init(frame: CGRect.init(x: originX - spacingBetweenRows, y: originY - (spacingBetweenRows/2), width:(CGFloat(TicTacToeVC.numberOfSquaresForBoardSetup) * squareWidthHeight) + (minimumSpacingRequiredBetweenColumns * (CGFloat(TicTacToeVC.numberOfSquaresForBoardSetup) - 1)) + spacingBetweenRows*2, height: seperatorLineWidth))
                rowSeperator.backgroundColor = UIColor.TicTacToeThemeColor.seperatorColor
                if row < TicTacToeVC.numberOfSquaresForBoardSetup {
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

        if WinLogicUtility.checkIfPlayerWins(sender.position) {
            title = "\(TicTacToeNextMove.player)->\(TicTacToeNextMove.player.getSymbol()) WON.."
            showAlertMessage("GAME OVER", title, "OK-Restart", actionSelector: resetTapped)
        }
        else if TicTacToeStore.selectedSquareCounter == (TicTacToeVC.numberOfSquaresForBoardSetup*TicTacToeVC.numberOfSquaresForBoardSetup) {
            title = "Draw Game.."
            showAlertMessage("GAME OVER", title, "OK-Restart", actionSelector: resetTapped)
        }
        else{
            TicTacToeNextMove.updateNextTurnPlayer()
            title = "NEXT-Player\(TicTacToeNextMove.player)->\(TicTacToeNextMove.player.getSymbol())"
      }
    }
    
    @objc func resetTapped() {
        view.removeAllSubviews()
        TicTacToeNextMove.resetMoveToStart()
        TicTacToeStore.clear()
        ticTacToeBoardSetUp()
        title = defaultNavigationTitle
        TicTacToeStore.selectedSquareCounter = 0
        self.navigationController?.navigationBar.endEditing(true)
    }
    
    // MARK: - Helper methods
    private func showAlertMessage(_ title: String,_ message: String?, _ actionButtonTitle: String, actionSelector:resetBoardSetupFunction?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle:UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: actionButtonTitle, style: UIAlertAction.Style.default)
        { action -> Void in
            if let act = actionSelector {
                act()
            }
        })
        self.present(alertController, animated: true, completion: nil)
    }
        
    // MARK: - UITextField Delegates
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // get the current text, or use an empty string if that failed
        let currentText = textField.text ?? ""
        
        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        // make sure the result is under 2 characters
        return updatedText.count <= 2
    }
    
    @objc func textFieldDidChange(_ textField: UITextField){
        print("Text changed")
        TicTacToeVC.numberOfSquaresForBoardSetup = Int(textField.text ?? "0") ?? 0
    }
}
