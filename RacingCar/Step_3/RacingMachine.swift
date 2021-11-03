//
//  RacingRecord.swift
//  RacingCar
//
//  Created by 임현규 on 2021/11/02.
//

import Foundation

class RacingMachine {
    var oneRoundEnded: (([String]) -> ())?
    
    func isOverThree(number: Int) -> String {
        return number > 3 ? "-" : ""
    }
    
    func startRacing(racing: RacingInput) {
        for _ in 0...racing.roundCount - 1 {
            let roundRecord: [String] = Array(0...racing.playingCarCount - 1)
                .map { String($0) }
                .reduce([]) { partialResult, _ in
                let randomNumber = (0...9).randomElement()!
                return partialResult + [isOverThree(number: randomNumber)]
            }
            self.oneRoundEnded?(roundRecord)
        }
    }
}
