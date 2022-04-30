//
//  ResultView.swift
//  RacingCar
//
//  Created by 카카오VX on 2022/04/27.
//

import Foundation

struct ResultView {
    static func racingResult(printable: RacingResultPrintable) {
        print("실행결과")
        printMatch(printable)
    }
    
    private static func printMatch(_ printable: RacingResultPrintable) {
        for match in printable.result() {
            print()
            printCarMove(match: match)
        }
    }
    
    private static func printCarMove(match: [Int]) {
        for move in match {
            print(RacingForwardLineMaker.convertNumberToLine(move: move), separator: "", terminator: "")
            print()
        }
    }
}
