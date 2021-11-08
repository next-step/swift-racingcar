//
//  RacingRecorderTest.swift
//  RacingTest
//
//  Created by 임현규 on 2021/11/03.
//

import XCTest
@testable import RacingCar

class RacingRecorderTest: XCTestCase {
    let racingRecoder = RacingRecorder(roundCount: 1)

    func test_record() {
        racingRecoder.appendResult(record: ["-","","-"])
        XCTAssertEqual(racingRecoder.roundResult, "실행 결과\n-\n\n-\n")
    }
}
