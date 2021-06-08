//
//  Location.swift
//  ChessWithAndy
//
//  Created by Andrew Pool on 10/8/20.
//

import Foundation




struct Location:Hashable
{
    
    static func + (lhs:Location, rhs:Location)->Location{
        return Location(row: rhs.row+lhs.row, column: rhs.column+lhs.column)
    }
    
    
    let row:Int
    let column:Int
    
    //this is inacuratly named
    public func mapped2Dto1D()->Int{
        return (row * 8) + column
    }
    
    public func isValid()->Bool{
        if(row < 0 || column < 0 || row > 7 || column > 7) {return false}
        
        return true
    }
    
    public static let knightHops = [//clockwise from top left
        Location(row: -1, column: 2)

        ,Location(row: 1, column: 2)

        ,Location(row: 2, column: 1)

        ,Location(row: 2, column: -1)

        ,Location(row: 1, column: -2)

        ,Location(row: -1, column: -2)

        ,Location(row: -2, column: -1)

        ,Location(row: -2, column: 1)

    ]
    
    
    public static let bishopVectors = [
        Location(row: -1, column: 1)

        ,Location(row: 1, column: 1)

        ,Location(row: 1, column: -1)

        ,Location(row: -1, column: -1)

    ]
    
    public static let rookVectors = [
        Location(row: -1, column: 0)

        ,Location(row: 1, column: 0)

        ,Location(row: 0, column: 1)

        ,Location(row: 0, column: -1)

    ]
    
    public static let royaltyVectors = [
        Location(row: -1, column: 1)

        ,Location(row: 1, column: 1)

        ,Location(row: 1, column: -1)

        ,Location(row: -1, column: -1)
        
        ,Location(row: -1, column: 0)

        ,Location(row: 1, column: 0)

        ,Location(row: 0, column: 1)

        ,Location(row: 0, column: -1)
    ]
}
