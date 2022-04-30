//
//  RandomDigitNumberMakerTests.swift
//  RacingCarTest
//
//  Created by 강수진 on 2022/05/01.
//

import XCTest

class RandomDigitNumberMakerTests: XCTestCase {
    
    var sut: RandomDigitNumberMaker!
    
    override func setUpWithError() throws {
        sut = RandomDigitNumberMaker()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_roundCount_whenAppendOneRound_equalToOne() throws {
        // given
        let numberRange = 0...9
        
        // when
        let result = sut.random()
        
        // then
        XCTAssert(numberRange ~= result)
    }
}
