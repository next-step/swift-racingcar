//
//  StringTests.swift
//  RacingCarTests
//
//  Created by swave on 2022/04/26.
//

import XCTest
/*
 MARK: String 타입에 대한 학습 테스트
 
 [요구사항 1]
 - "1,2"을 ,로 split 했을 때 1과 2로 잘 분리되는지 확인하는 학습 테스트를 구현합니다.
 - "1"을 ,로 split 했을 때 1만을 포함하는 Array가 반환되는지에 대한 학습 테스트를 구현합니다.
 
[힌트]
 - Array로 반환하는 값의 경우 XCTAssertEqual()을 활용해 반환 값이 맞는지 검증합니다.
 - Array로 반환하는 값의 경우 XCTAssert()와 Array의 비교(==)를 활용해 반환 값이 맞는지 검증합니다.
 
 [요구사항 2]
 - "(1,2)" 값이 주어졌을 때 String의 replacingOccurrences(of:with:) 메소드를 활용해 ()을 제거하고 "1,2"를 반환하도록 구현합니다.
 */
class RacingCarTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

        
    // "1,2"을 ,로 split 했을 때 1과 2로 잘 분리되는지 확인하는 학습 테스트를 구현합니다.
    func testSplitString() throws {
        let request: String = "1,2"
        let splitResult = request.split(separator: ",")
        XCTAssertEqual(["1", "2"], splitResult)
    }
    
    //"1"을 ,로 split 했을 때 1만을 포함하는 Array가 반환되는지에 대한 학습 테스트를 구현합니다.
    func testSplitString2() throws {
        let request: String = "1"
        let splitResult = request.split(separator: ",")
        XCTAssertEqual(["1"], splitResult)
    }
    
    // "(1,2)" 값이 주어졌을 때 String의 replacingOccurrences(of:with:) 메소드를 활용해 ()을 제거하고 "1,2"를 반환하도록 구현합니다.
    func testReplacingOccurrences() throws {
        let request: String = "(1,2)"
        var replacedResult = request.replacingOccurrences(of: "(", with: "")
        replacedResult = replacedResult.replacingOccurrences(of: ")", with: "")
        XCTAssertEqual("1,2", replacedResult)
    }


}
