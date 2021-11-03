//
//  RacingCarPrinter.swift
//  RacingCar
//
//  Created by 임현규 on 2021/11/02.
//

import Foundation

class RacingRecorder {
    var racingFinish: (() -> ())?
    private var racingCount: Int
    private var preRacingResult = [String]()
    
    private var roundResult: String = "실행 결과\n" {
        didSet {
            racingCount -= 1
            if racingCount == 0 {
                self.racingFinish?()
            }
        }
    }
    
    init(roundCount: Int) {
        self.racingCount = roundCount
    }
    
    func appendResult(record: [String]) {
        if preRacingResult.isEmpty {
            preRacingResult = record
            self.roundResult += record.reduce("") {
                return $0 + "\($1)\n"
            }
            return
        }
        let zipArray = zip(preRacingResult,record)
        let newRecord = zipArray.map { $0.0 + $0.1 }
        let roundResult = newRecord.reduce("", {
            return $0 + "\($1)\n"
        })
        self.roundResult += "\(roundResult)\n"
        preRacingResult = newRecord
    }
    
    func racingResult() -> String {
        return self.roundResult
    }
}
