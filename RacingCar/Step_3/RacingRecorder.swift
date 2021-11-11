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
            self.roundResult += record.reduce("") {
                return $0 + "\($1)\n"
            }
            roundCount -= 1
            return
        }
        let zipArray = zip(preRacingResult,record)
        let newRecord = zipArray.map { $0.0 + $0.1 }
        let roundResult = newRecord.reduce("", {
            return $0 + "\($1)\n"
        })
        roundCount -= 1
        self.roundResult += "\(roundResult)\n"
        preRacingResult = newRecord
    }
    
    @discardableResult
    func racingResult() -> String {
        print(self.roundResult)
        return self.roundResult
    }
}
