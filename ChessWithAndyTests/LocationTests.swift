//
//  LocationTests.swift
//  ChessWithAndyTests
//
//  Created by Andrew Pool on 10/9/20.
//

import XCTest
@testable import ChessWithAndy

class LocationTests: XCTestCase {
    let zeroLocation = Location(row: 0, column: 0)
    
    let offBoard1 = Location(row: 0, column: -1)
    let offBoard2 = Location(row: 0, column: 8)
    let offBoard3 = Location(row: 8, column: 0)
    let offBoard4 = Location(row: -1, column: 0)
    
    
    func testLocationAddition(){
        let rhs = Location(row: 1, column: 1)
        let lhs = Location(row: -1, column: 1)
        let result = Location(row: 0, column: 2)
        
        XCTAssert(rhs + lhs == result)
    }
    
    func testMapped2D(){
        
        XCTAssert(zeroLocation.mapped2Dto1D() == 0)
        
        
        
    }
    
    func testIsValid(){
        XCTAssertTrue(zeroLocation.isValid())
        
        XCTAssertFalse(offBoard1.isValid())
        XCTAssertFalse(offBoard2.isValid())
        XCTAssertFalse(offBoard3.isValid())
        XCTAssertFalse(offBoard4.isValid())
    }

}
