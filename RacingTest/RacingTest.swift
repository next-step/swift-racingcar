//
//  RacingTest.swift
//  RacingTest
//
//  Created by 이우섭 on 2022/05/07.
//

import XCTest

class RacingTest: XCTestCase {
    
    func test_랜덤_숫자가_4미만이면_전진안함() {
        let car = Car(position: 0)
        car.drive(by: 3)
        XCTAssertEqual(car.position, 0)
    }
    
    func test_랜덤_숫자가_4이상이면_전진() {
        let car = Car(position: 0)
        car.drive(by: 4)
        XCTAssertEqual(car.position, 1)
    }
    
    func test_레이싱_참가자가_nil_이면_오류반환() {
        XCTAssertThrowsError(try RacingGame(participantsCount: nil, roundCount: 0))
    }
    
    func test_레이싱_참가자가_음수이면_오류반환() {
        XCTAssertThrowsError(try RacingGame(participantsCount: -1, roundCount: 0))
    }
    
    func test_라운드_횟수가_nil_이면_오류반환() {
        XCTAssertThrowsError(try RacingGame(participantsCount: 0, roundCount: nil))
    }
    
    func test_라운드_횟수가_음수이면_오류반환() {
        XCTAssertThrowsError(try RacingGame(participantsCount: 0, roundCount: -1))
    }
    
    func test_자동차가_모두_동일선상에서_출발() throws {
        let game = try RacingGame(participantsCount: 3, roundCount: 0)
        game.participants.forEach({
            XCTAssertEqual($0.position, 0)
        })
    }
}
