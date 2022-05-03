//
//  SetTests.swift
//  RacingCarTests
//
//  Created by swave on 2022/04/26.
//

import XCTest

/*
 MARK: Set Collection에 대한 학습 테스트
 - Set의 count 프로퍼티를 활용해 Set에 포함된 요소의 갯수를 확인하는 학습테스트를 구현합니다.
 */

class SetTests: XCTestCase {
    
    private var numbers: Set<Int> = []
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        numbers.removeAll()
        numbers.insert(1)
        numbers.insert(1)
        numbers.insert(2)
        numbers.insert(3)
    }
    
    // Set의 count 프로퍼티를 활용해 Set에 포함된 요소의 갯수를 확인하는 학습테스트를 구현합니다.
    func testCountSet() throws {
        let count: Int = numbers.count
        
        //Q. 확인을 어떻게 하라는 말씀이신가요?
        print("Set에 포함된 요소의 갯수: \(count)") //<- 1번 처럼?
        XCTAssertEqual(3, count) //<- 2번처럼??
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
   

}
