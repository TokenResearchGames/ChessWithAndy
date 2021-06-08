//
//  ChessBoard.swift
//  ChessWithAndy
//
//  Created by Andrew Pool on 10/8/20.
//

import Foundation

typealias ChessBoard = [  [ChessPiece]  ]


extension ChessBoard{
    static func classicStart()->ChessBoard{
        return [
            //whiteside
            
            [ .White_Rook,.White_Knight,.White_Bishop,.White_Queen,.White_King,.White_Bishop,.White_Knight,.White_Rook],
            
            [ .White_Pawn,.White_Pawn,.White_Pawn,.White_Pawn,.White_Pawn,.White_Pawn,.White_Pawn,.White_Pawn],
            
            
            //deadspace
            [.Empty,.Empty,.Empty,.Empty,.Empty,.Empty,.Empty,.Empty],
            
            [.Empty,.Empty,.Empty,.Empty,.Empty,.Empty,.Empty,.Empty],
            
            [.Empty,.Empty,.Empty,.Empty,.Empty,.Empty,.Empty,.Empty],
            
            [.Empty,.Empty,.Empty,.Empty,.Empty,.Empty,.Empty,.Empty],
            
            //blackside
            
            [.Black_Pawn, .Black_Pawn, .Black_Pawn, .Black_Pawn, .Black_Pawn, .Black_Pawn, .Black_Pawn, .Black_Pawn],
            
            [.Black_Rook, .Black_Knight, .Black_Bishop, .Black_Queen, .Black_King, .Black_Bishop, .Black_Knight, .Black_Rook]
            
        ]
    }
    
    #if Debug
    
    public func printToConsole(){
        print(self)
    }
    
    #endif
    
    
    public func score()->Int32{
        return self.reduce(0){
            $0 + $1.reduce(0){
                $0 + $1.rawValue
            }
        }
    }
    
    
    static let locationNames = [
        
        ["a1","b1","c1","d1","e1","f1","g1","h1"],
        ["a2","b2","c2","d2","e2","f2","g2","h2"],
        ["a3","b3","c3","d3","e3","f3","g3","h3"],
        ["a4","b4","c4","d4","e4","f4","g4","h4"],
        ["a5","b5","c5","d5","e5","f5","g5","h5"],
        ["a6","b6","c6","d6","e6","f6","g6","h6"],
        ["a7","b7","c7","d7","e7","f7","g7","h7"],
        ["a8","b8","c8","d8","e8","f8","g8","h8"],
        
    ]
    
    
    public func isValid()->Bool{
        //self = columns
        if(self.count != 8){return false}
        
        for (row) in self{
            if(row.count != 8){return false}
        }
        
        return true
    }
    
}
