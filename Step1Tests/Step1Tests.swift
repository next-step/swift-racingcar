//
//  Step1Tests.swift
//  Step1Tests
//
//  Created by 김동현 on 2021/10/27.
//

import XCTest

class Step1Tests: XCTestCase {
    
    var text = ""

    override func setUpWithError() throws {
//        text = "1,2"
//        text = "1"
//        text = "(1,2)"
    }

    override func tearDownWithError() throws {
        text = ""
    }

    /// "1,2"을 ,로 split 했을 때 1과 2로 잘 분리되는지 확인하는 학습 테스트를 구현합니다.
    func testSplitResultIsTwoElement() throws {
        let splitResult = text.split(separator:",")
        XCTAssertEqual(splitResult.count, 2)
    }
    
    /// "1"을 ,로 split 했을 때 1만을 포함하는 Array가 반환되는지에 대한 학습 테스트를 구현합니다.
    func testSplitResultIsContain1AlsoCountIs1() throws {
        let splitResult = text.split(separator:",")
        XCTAssertEqual(splitResult, ["1"])
    }
    
    /// "(1,2)" 값이 주어졌을 때 String의 replacingOccurrences(of:with:) 메소드를 활용해 ()을 제거하고 "1,2"를 반환하도록 구현합니다.
    func testRemoveBrace() -> String {
        let replacingResultLeft = text.replacingOccurrences(of: "(", with: "")
        let output = replacingResultLeft.replacingOccurrences(of: ")", with: "")
        return output
    }
}

class SetTests: XCTestCase {
    private var numbers: Set<Int> = []
    
    override func setUpWithError() throws {
        numbers.removeAll()
        numbers.insert(1)
        numbers.insert(1)
        numbers.insert(2)
        numbers.insert(3)
    }
    
    /// Set의 count 프로퍼티를 활용해 Set에 포함된 요소의 갯수를 확인하는 학습테스트를 구현합니다.
    func testCheckNumbersElementCount() throws {
        print(numbers.count)
    }
}
