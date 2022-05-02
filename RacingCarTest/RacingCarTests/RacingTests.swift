//
//  RacingTests.swift
//  RacingCarTest
//
//  Created by YooBin Jo on 2022/05/02.
//

import XCTest

class RacingTests: XCTestCase {
    
    func test_차량을_한_사이클_돌렸을_때_잘_돌아가는지_테스트() throws {
        var cars: [Car] = []
        ["yagom", "cozy", "jinie"].forEach { name in
            cars.append(Car(name: name))
        }
        XCTAssertNoThrow(try Racing().run(cars: cars, completion: { _ in }))
    }
}
