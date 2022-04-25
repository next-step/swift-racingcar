//
//  StringTypeTest.swift
//  RacingCarTest
//
//  Created by YooBin Jo on 2022/04/25.
//

import XCTest
@testable import RacingCar

class StringTypeTest: XCTestCase {
    
    private let oneTwo: String = "1,2"
    private let one: String = "1"

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStringType() throws {
        XCTAssert(oneTwo.split(separator: ",") == ["1", "2"], "\"1, 2\"를 ,로 split하면 [\"1\", \"2\"]가 나오지 않는다.")
        XCTAssert(one.split(separator: ",") == ["1"], "\"1\"를 ,로 split하면 [\"1\"]가 나오지 않는다.")
        XCTAssertEqual(oneTwo.split(separator: ","), ["1", "2"], "\"1, 2\"를 ,로 split하면 [\"1\", \"2\"]가 나오지 않는다.")
        XCTAssertEqual(one.split(separator: ","), ["1"], "\"1\"를 ,로 split하면 [\"1\"]가 나오지 않는다.")
        
        XCTAssertEqual("(1,2)".replacingBracketToBlank(), "1,2", "(1,2)에서 괄호를 지워도 1,2가 나오지 않는다.")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
