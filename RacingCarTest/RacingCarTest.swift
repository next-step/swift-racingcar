//
//  RacingCarTest.swift
//  RacingCarTest
//
//  Created by brian은석 on 2022/04/26.
//

import XCTest
@testable import RacingCar

class RacingCarTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test1쉼표2분리() throws {
        let split = Splitter()
        let test = split.targetWithComma("1,2")
        let result = ["1","2"]
        XCTAssert(test == result , "1,2 는 [1,2] 실패")
    }
    
    func test1을콤마로쪼개면배열1로나온다() throws {
        let split = Splitter()

        XCTAssert(split.targetWithComma("1") == ["1"],"[1] 실패")
    }
    
    func test괄호1콤마2괄호는1콤마2나온다() throws {
        let split = Splitter()
        
        XCTAssert(split.targetWithBracketAndComma("(1,2)") == "1,2","1,2 결과 값 실패")
    }

}


