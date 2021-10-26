//
//  RacingCarTest.swift
//  RacingCarTest
//
//  Created by 남기범 on 2021/10/27.
//

import XCTest
@testable import RacingCar

class RacingCarTest: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func test_string_split() {
        let dummyString1 = "1,2"
        let dummyString2 = "1"
        
        let dummyString1Array = dummyString1.split(separator: ",")
        let dummyString2Array = dummyString2.split(separator: ",")
        
        guard dummyString1Array.count < 2,
              dummyString2Array.count < 1 else { return }
        
        XCTAssertEqual(dummyString1Array[0], "1")
        XCTAssertEqual(dummyString1Array[1], "2")
        XCTAssertEqual(dummyString2Array[0], "1")
    }
    
    func test_string_replacingOccurrences() {
        var dummyString = "(1,2)"
        
        dummyString = dummyString.replacingOccurrences(of: "(", with: "")
        dummyString = dummyString.replacingOccurrences(of: ")", with: "")
        
        XCTAssertEqual(dummyString, "1,2")
    }
}
