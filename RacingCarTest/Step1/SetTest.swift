//
//  SetTest.swift
//  RacingCarTest
//
//  Created by 이정배 on 2022/04/27.
//

import Foundation
import XCTest

class SetTests: XCTestCase {
    private var numbers: Set<Int> = []

    override func setUpWithError() throws {
        numbers.removeAll()
        numbers.insert(1)
        numbers.insert(1)
        numbers.insert(2)
        numbers.insert(3)
    }

    // Test Case 구현
    func testCount() {
        // setUp 이후 현재 갯수는 3개여야 한다.
        XCTAssertEqual(numbers.count, 3, "setUp 이후 현재 갯수는 3개여야 한다.")
        // 1개 제거 후 테스트
        numbers.remove(1)
        XCTAssertEqual(numbers.count, 2, "1개 제거 이후 Set의 현재 개수는 2이여야 한다.")
        // "1" 주입
        numbers.insert(1)
        XCTAssertEqual(numbers.count, 3, "1 주입 이후 Set의 현재 개수는 3이어야 한다.")
        // "1" 주입
        numbers.insert(1)
        // 한번 더 넣어도 갯수는 같아야 한다. Set은 같은 값은 하나만 가질 수 있기 때문이다.
        XCTAssertEqual(numbers.count, 3, "Set이 이미 가진 값을 한 번 더 넣었는데, Count에 변화가 생겼다.")
        // 새로운 값 주입
        numbers.insert(7)
        XCTAssertEqual(numbers.count, 4, "새로운 값 주입 이후 Set의 현재 개수는 4이어야 한다.")
        // 다 없앤다.
        numbers.removeAll()
        XCTAssertEqual(numbers.count, 0, "다 지운 상황에서 Count가 0이 아닌 상황 발생")
    }
    
    // 새로운 테스트가 추가되어도 setUpWithError에 의해서 다시 값이 설정되어야 한다.
    func testsetUpWithError() {
        // testCount()와 내용이 동일하다.

        // setUp 이후 현재 갯수는 3개여야 한다.
        XCTAssertEqual(numbers.count, 3)
        // 1개 제거 후 테스트
        numbers.remove(1)
        XCTAssertEqual(numbers.count, 2)
        // "1" 주입
        numbers.insert(1)
        XCTAssertEqual(numbers.count, 3)
        // "1" 주입
        numbers.insert(1)
        // 한번 더 넣어도 갯수는 같아야 한다. Set은 같은 값은 하나만 가질 수 있기 때문이다.
        XCTAssertEqual(numbers.count, 3)
        // 새로운 값 주입
        numbers.insert(7)
        XCTAssertEqual(numbers.count, 4)
        // 다 없앤다.
        numbers.removeAll()
        XCTAssertEqual(numbers.count, 0)
    }
}
