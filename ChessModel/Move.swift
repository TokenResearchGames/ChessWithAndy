//
//  Move.swift
//  ChessWithAndy
//
//  Created by Andrew Pool on 10/8/20.
//

import Foundation


enum Move:Hashable{
    case Standard(Location,Location)
    case CastleLong(Location,Location)
    case CastleShort(Location,Location)
    case EnPassant(Location,Location)
    case Promotion(Location,Location,ChessPiece)
}
