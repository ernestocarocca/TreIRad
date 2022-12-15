//
//  Player.swift
//  TicTacToe
//
//  Created by Ernesto Carocca on 2022-11-30.
//

import Foundation
import UIKit
class Player
{
    
    var name : String
    var marker : String
    var color :UIColor
    
    init(name: String, marker: String,color: UIColor?)  {
        self.name = name
        self.marker = marker
        self.color = color ?? .white
    }
    
    
}
