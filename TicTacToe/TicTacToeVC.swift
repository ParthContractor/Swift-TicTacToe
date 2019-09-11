//
//  TicTacToeVC.swift
//  TicTacToe
//
//  Created by Parth on 11/09/19.
//  Copyright © 2019 Parth. All rights reserved.
//

import UIKit

class CustomSquareButton: UIView {
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
    
    func decorateButton() {
        self.backgroundColor = .red
    }
}

//let u = CustomSquareButton(frame: CGRect.zero)
//let v = CustomSquareButton()
//
class TicTacToeVC: ParentViewController {
   
    // MARK: - Initial Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ticTacToeBoardSetUp()
    }
    
    func ticTacToeBoardSetUp(){

        
        
        
    }
    
}
