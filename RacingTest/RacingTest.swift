//
//  RacingTest.swift
//  RacingTest
//
//  Created by 이우섭 on 2022/05/07.
//

import XCTest

class RacingTest: XCTestCase {
    
    func test_랜덤_숫자가_4미만이면_전진안함() {
        let car = Car(name: "test", position: 0)
        car.drive(by: 3)
        XCTAssertEqual(car.position, 0)
    }
    
    func test_랜덤_숫자가_4이상이면_전진() {
        let car = Car(name: "test", position: 0)
        car.drive(by: 4)
        XCTAssertEqual(car.position, 1)
    }
    
    func test_레이싱_참가자가_nil_이면_오류반환() {
        XCTAssertThrowsError(try RacingGame(participants: nil, roundCount: 0))
    }
    
    func test_라운드_횟수가_nil_이면_오류반환() {
        XCTAssertThrowsError(try RacingGame(participants: [], roundCount: nil))
    }
    
    func test_라운드_횟수가_음수이면_오류반환() {
        XCTAssertThrowsError(try RacingGame(participants: [], roundCount: -1))
    }
    
    func test_자동차가_모두_동일선상에서_출발() throws {
        let game = try RacingGame(participants: ["sut1", "sut2", "sut3"], roundCount: 0)
        game.participants.forEach({
            XCTAssertEqual($0.position, 0)
        })
    }
    
    func test_라운드가_한번_진행() throws {
        var game = try RacingGame(participants: [], roundCount: 1)
        try game.playOneRound()
        XCTAssertEqual(game.currentRound, 1)
    }
    
    func test_라운드가_정해진_횟수보다_많이_진행되면_오류반환() throws {
        var game = try RacingGame(participants: [], roundCount: 3)
        for _ in 0..<3 {
            try game.playOneRound()
        }
        XCTAssertThrowsError(try game.playOneRound())
    }
}
