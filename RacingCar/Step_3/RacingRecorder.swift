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
    
    func appendResult(record: String) {
        self.roundResult += "\(record)\n"
    }
    
    func racingResult() -> String {
        return self.roundResult
    }
}
