//
//  MoveCheckerTests.swift
//  RacingCarTests
//
//  Created by itzel.du on 2021/11/08.
//

import XCTest

class MoveCheckerTests: XCTestCase {
    let moveChecker = MoveChecker(movableRange: Range<Int>(4...9))
    
    func test_isMovable_true() {
        XCTAssertTrue(moveChecker.isMovable(4))
    }
    
    func test_isMovable_false() {
        XCTAssertFalse(moveChecker.isMovable(0))
    }

}
