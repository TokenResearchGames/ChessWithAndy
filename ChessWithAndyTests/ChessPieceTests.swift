//
//  ChessPieceTests.swift
//  ChessWithAndyTests
//
//  Created by Andrew Pool on 10/9/20.
//

import XCTest
@testable import ChessWithAndy

class ChessPieceTests: XCTestCase {

    let empty = ChessPiece.Empty
    
    let wp = ChessPiece.White_Pawn
    let wkn = ChessPiece.White_Knight
    let wb = ChessPiece.White_Bishop
    let wr = ChessPiece.White_Rook
    let wq = ChessPiece.White_Queen
    let wK = ChessPiece.White_King
    
    let bp = ChessPiece.Black_Pawn
    let bkn = ChessPiece.Black_Knight
    let bb = ChessPiece.Black_Bishop
    let br = ChessPiece.Black_Rook
    let bq = ChessPiece.Black_Queen
    let bK = ChessPiece.Black_King
    
    func testEmpty(){
        XCTAssertEqual(empty.rawValue, 0)
        XCTAssertEqual(empty.description, "Empty")
    }
    
    func testPawn(){
        XCTAssertEqual(wp.rawValue, 2)
        
        XCTAssertEqual("\(wp)", "White Pawn")
        XCTAssertNotEqual("\(wp)", "Black Pawn")//check this assert works
        XCTAssertEqual("\(bp)", "Black Pawn")
        //since we've already done the White piece value this assert
        //proves that the Black value is correct, and complimentary.
        XCTAssertEqual(wp.rawValue + bp.rawValue, 0)
    }
    
    func testKnight(){
        XCTAssertEqual(wkn.rawValue, 6)
        
        XCTAssertEqual("\(wkn)", "White Knight")
       
        XCTAssertEqual("\(bkn)", "Black Knight")
       
        XCTAssertEqual(wkn.rawValue + bkn.rawValue, 0)
    }
    
    func testBishop(){
        XCTAssertEqual(wb.rawValue, 7)
        
        XCTAssertEqual("\(wb)", "White Bishop")
       
        XCTAssertEqual("\(bb)", "Black Bishop")
        
        XCTAssertEqual(wb.rawValue + bb.rawValue, 0)
    }
    func testRook(){
        XCTAssertEqual(wr.rawValue, 10)
        
        XCTAssertEqual("\(wr)", "White Rook")
       
        XCTAssertEqual("\(br)", "Black Rook")
    
        XCTAssertEqual(wr.rawValue + br.rawValue, 0)
    }
    
    func testQueen(){
        XCTAssertEqual(wq.rawValue, 20)
        
        XCTAssertEqual("\(wq)", "White Queen")
       
        XCTAssertEqual("\(bq)", "Black Queen")
    
        XCTAssertEqual(wq.rawValue + bq.rawValue, 0)
    }
    func testKing(){
        XCTAssertEqual(wK.rawValue, 100000)
        
        XCTAssertEqual("\(wK)", "White King")
       
        XCTAssertEqual("\(bK)", "Black King")
    
        XCTAssertEqual(wK.rawValue + bK.rawValue, 0)
    }

}
