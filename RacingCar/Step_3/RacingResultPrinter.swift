//
//  RacingResultPrinter.swift
//  RacingCar
//
//  Created by 임현규 on 2021/11/13.
//

import Foundation

struct RacingResultPrinter {
    private var roundCount: Int
    
    init(roundCount: Int) {
        self.roundCount = roundCount
    }
    
    mutating func printResult(result: String) {
        roundCount -= 1
        if roundCount == 0 {
            print(result)
        }
    }
}
