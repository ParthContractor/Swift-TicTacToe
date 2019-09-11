//
//  TicTacToeSquareButton.swift
//  TicTacToe
//
//  Created by Parth on 11/09/19.
//  Copyright © 2019 Parth. All rights reserved.
//

import UIKit

class TicTacToeSquareButton: UIButton {
    var position: Position!

    override var isSelected: Bool {
        didSet {
            animate()//Button selection(transition from normal to selected state) animation
            disableInteraction()//restrict selection once player selected(position locked in boardstore)
            lastSelectedByPlayer()//Initially position is without any associated player; but after selection update with respective value
            
            //set 'O' or 'X' based on player's associated mark/symbol
            updateSymbolSelection()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        decorateButton()
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("Does not support NSCoding")
    }
    
    private func decorateButton() {
        self.backgroundColor = UIColor.TicTacToeThemeColor.defaultSquareColor
    }
    
    private func animate() {
        UIButton.animate(withDuration: 0.5, animations: {
            self.backgroundColor = UIColor.TicTacToeThemeColor.selectedSquareColor
        })
    }
    
    private func disableInteraction() {
        self.isUserInteractionEnabled = false
    }
    
    private func lastSelectedByPlayer() {
        self.position.updatePlayer(TicTacToeNextMove.player)
    }
    
    private func updateSymbolSelection() {
        if TicTacToeNextMove.player == .Player1 {
            self.setTitle(player1SelectionSymbol, for: .normal)
        }
        else{
            self.setTitle(player2SelectionSymbol, for: .normal)
        }
    }
}
