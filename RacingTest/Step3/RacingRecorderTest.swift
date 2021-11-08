//
//  RacingRecorderTest.swift
//  RacingTest
//
//  Created by 임현규 on 2021/11/03.
//

import XCTest
@testable import RacingCar

class RacingRecorderTest: XCTestCase {
    var store: RacingRecorder!

    override func tearDownWithError() throws {
        self.store = nil
    }

    func test_round_count() {
        self.store = RacingRecorder(roundCount: 1)
        store.appendResult(record: [])
        XCTAssertEqual(store.roundCount, 0)
    }
    
    func test_append_result() {
        self.store = RacingRecorder(roundCount: 2)
        store.appendResult(record: ["test", "test"])
        XCTAssertEqual(store.preRacingResult, ["test", "test"])
    }
}
