//
//  GameMeta.swift
//  ChessWithAndy
//
//  Created by Andrew Pool on 10/8/20.
//

import Foundation


typealias player = Bool

//this could be an enum a-la the move...
struct GameMeta:Hashable{
    
    let whiteTurn:Bool
    
    let whiteCastleLong:Bool
    let whiteCastleShort:Bool
    
    let blackCastleLong:Bool
    let blackCastleShort:Bool
   
    let releventEnPassant:Int? ///if the last piece moved was a pawn 2 spaces this is the index of the column, otherwise it is optional
    
    static let startNormalGame = GameMeta(whiteTurn: true, whiteCastleLong: true, whiteCastleShort: true, blackCastleLong: true, blackCastleShort: true, releventEnPassant: 9)
}


