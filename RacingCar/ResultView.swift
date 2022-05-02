//
//  ResultView.swift
//  RacingCar
//
//  Created by 카카오VX on 2022/04/27.
//

import Foundation

struct ResultView {
    static func printRacingResult(printable: RacingResultPrintable) {
        print("실행결과")
        for match in printable.racingInfo() {
            print()
            printMatch(match)
        }
        
        printWinner(printable.winnerGroup())
    }
    
    private static func printMatch(_ match: [AbleToRace]) {
        for racer in match {
            let name: String = racer.racerName()
            let move: String = RacingForwardLineMaker.convertNumberToLine(move: racer.moveCountByRacer())
            print("\(name): \(move)", separator: "", terminator: "")
            print()
        }
    }

    private static func printWinner(_ winner: [AbleToRace]) {
        print("우승자는!!!")
        for racer in winner {
            print(racer.racerName())
        }
    }
    
    private static func printCarMove(match: [Int]) {
        for move in match {
            print(RacingForwardLineMaker.convertNumberToLine(move: move), separator: "", terminator: "")
            print()
        }
    }
}
