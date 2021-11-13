//
//  RacingCarPrinter.swift
//  RacingCar
//
//  Created by 임현규 on 2021/11/02.
//

import Foundation

class RacingRecorder {
    private var racingPrinter: RacingResultPrinter
    var preRacingResult = [String]()
    var roundResult: String = "실행 결과\n" {
        didSet {
            racingPrinter.printResult(result: roundResult)
        }
    }
    
    init(roundCount: Int) {
        self.racingPrinter = RacingResultPrinter(roundCount: roundCount)
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
}
