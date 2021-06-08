//
//  ChessPiece.swift
//  Chess With Andy
//
//  Created by Andrew Pool on 10/7/20.
//  Copyright © 2020 TokenResearch. All rights reserved.
//

import Foundation




enum ChessPiece: Int32, CustomStringConvertible
{
    
    case Empty = 0
    case White_Pawn = 2
    case Black_Pawn = -2
    case White_Knight = 6
    case Black_Knight = -6
    case White_Bishop = 7
    case Black_Bishop = -7
    case White_Rook = 10
    case Black_Rook = -10
    case White_Queen = 20
    case Black_Queen = -20
    case White_King = 100000
    case Black_King = -100000
    
    public func isWhite()->Bool{
        return self.rawValue > 0
    }
    
    public func isBlack()->Bool{
        return self.rawValue < 0
    }
    
    var description: String{
        switch(self){
        case .Empty: return "Empty"
        case .White_Pawn: return "White Pawn"
        case .Black_Pawn: return "Black Pawn"
        case .White_Knight : return "White Knight"
        case .Black_Knight : return "Black Knight"
        case .White_Bishop : return "White Bishop"
        case .Black_Bishop : return "Black Bishop"
        case .White_Rook : return "White Rook"
        case .Black_Rook : return "Black Rook"
        case .White_Queen : return "White Queen"
        case .Black_Queen : return "Black Queen"
        case .White_King : return "White King"
        case .Black_King : return "Black King"
        //default: return "Borken"
        }
    }
    
    
    
    
    
    
}
