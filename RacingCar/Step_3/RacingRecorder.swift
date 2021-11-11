//
//  RacingCarPrinter.swift
//  RacingCar
//
//  Created by 임현규 on 2021/11/02.
//

import Foundation

class RacingRecorder {
    var preRacingResult = [String]()
    var roundCount: Int
    var roundResult: String = "실행 결과\n" {
        didSet {
            self.roundCount -= 1
            if roundCount == 0 {
                self.racingResult()
            }
        }
    }
    
    init(roundCount: Int) {
        self.roundCount = roundCount
    }
    
    func appendResult(record: [String]) {
        if preRacingResult.isEmpty {
            preRacingResult = record
            let firstRecord = combineRecord(record: record)
            self.roundResult += "\(firstRecord)\n"
            return
        }
        let zipArray = zip(preRacingResult,record)
        let newRecord = zipArray.map { $0.0 + $0.1 }
        preRacingResult = newRecord
        let combineRecord = combineRecord(record: newRecord)
        self.roundResult += "\(combineRecord)\n"
    }
    
    func combineRecord(record: [String]) -> String {
        return record.reduce("") {
            return $0 + "\($1)\n"
        }
    }
    
    @discardableResult
    func racingResult() -> String {
        print(self.roundResult)
        return self.roundResult
    }
}
