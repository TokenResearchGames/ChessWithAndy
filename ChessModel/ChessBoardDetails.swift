//
//  ChessBoardDetails.swift
//  ChessWithAndy
//
//  Created by Andrew Pool on 10/8/20.
//

import Foundation


struct ChessBoardDetails {
    let piecesCanMoveTo:  [Location:[Location]]
    
    let piecesTakeOnto:[[  [Location]  ]]
    
    let check:Bool
    
    let winner: Bool?
}
