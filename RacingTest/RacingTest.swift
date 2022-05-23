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
    
    func test_이름이_5글자가_넘는_참가자가_있으면_오류반환() {
        XCTAssertThrowsError(try RacingGame(participants: ["errorSUT", "sut1"], roundCount: 0, numberGenerator: DummyGenerator()))
    }
    
    func test_레이싱_참가자가_nil_이면_오류반환() {
        XCTAssertThrowsError(try RacingGame(participants: nil, roundCount: 0, numberGenerator: DummyGenerator()))
    }
    
    func test_라운드_횟수가_nil_이면_오류반환() {
        XCTAssertThrowsError(try RacingGame(participants: ["sut1"], roundCount: nil, numberGenerator: DummyGenerator()))
    }
    
    func test_라운드_횟수가_음수이면_오류반환() {
        XCTAssertThrowsError(try RacingGame(participants: ["sut1"], roundCount: -1, numberGenerator: DummyGenerator()))
    }
    
    func test_자동차가_모두_동일선상에서_출발() throws {
        let game = try RacingGame(participants: ["sut1", "sut2", "sut3"], roundCount: 0, numberGenerator: DummyGenerator())
        game.participants.forEach({
            XCTAssertEqual($0.position, 0)
        })
    }
    
    func test_라운드가_한번_진행() throws {
        var game = try RacingGame(participants: ["sut1"], roundCount: 1, numberGenerator: DummyGenerator())
        try game.playOneRound()
        XCTAssertEqual(game.currentRound, 1)
    }
    
    func test_라운드가_정해진_횟수보다_많이_진행되면_오류반환() throws {
        var game = try RacingGame(participants: ["sut1"], roundCount: 3, numberGenerator: DummyGenerator())
        for _ in 0..<3 {
            try game.playOneRound()
        }
        XCTAssertThrowsError(try game.playOneRound())
    }
    
    func test_자동차가_라운드가_진행될때마다_4이상이면_전진() throws {
        var game = try RacingGame(participants: ["sut1"], roundCount: 3, numberGenerator: ForwardNumberGenerator())
        for count in 1...3 {
            try game.playOneRound()
            XCTAssertEqual(game.participants.first!.position, count)
        }
    }
    
    func test_자동차가_라운드가_진행될때마다_4미만이면_전진못함() throws {
        var game = try RacingGame(participants: ["sut1"], roundCount: 3, numberGenerator: MissNumberGenerator())
        for _ in 1...3 {
            try game.playOneRound()
            XCTAssertEqual(game.participants.first!.position, 0)
        }
    }
}
