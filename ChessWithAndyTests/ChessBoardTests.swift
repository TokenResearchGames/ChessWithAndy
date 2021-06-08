//
//  ChessBoardTests.swift
//  ChessWithAndyTests
//
//  Created by Andrew Pool on 10/9/20.
//

import XCTest

class ChessBoardTests: XCTestCase {
    
    let startBoard = ChessBoard.classicStart()
    let invalidBoard = [[ChessPiece.Empty]]
    
    func testChessBoardValid(){
        XCTAssert(startBoard.isValid())
        
        XCTAssertFalse(invalidBoard.isValid())
    }
    
    func testLocationNames(){
        
        let whiteKingLocation = Location(row: 0, column: 4)
        
        XCTAssertEqual(startBoard[whiteKingLocation.row][whiteKingLocation.column], ChessPiece.White_King)
        
        XCTAssertEqual(ChessBoard.locationNames[whiteKingLocation.row][whiteKingLocation.column], "e1")
    }
    
    func testPrint(){
        print(startBoard)
    }

}
