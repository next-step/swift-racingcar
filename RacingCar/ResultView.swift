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
        for match in printable.result() {
            print()
            for move in match {
                print(self.convertNumberToLine(move: move), separator: "", terminator: "")
                print()
            }
        }
    }
    
    static  func convertNumberToLine(move: Int) -> String {
        var line = ""
        
        for _ in 0..<move {
            line += "-"
        }
        
        return line
    }
}
