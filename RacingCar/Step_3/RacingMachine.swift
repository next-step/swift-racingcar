//
//  RacingRecord.swift
//  RacingCar
//
//  Created by 임현규 on 2021/11/02.
//

import Foundation

struct RacingMachine {
    private let racinginput: RacingInput
    private let roundRecorder: RacingRecorder
    
    init(racingInput: RacingInput) {
        self.racinginput = racingInput
        self.roundRecorder = RacingRecorder(roundCount: racingInput.roundCount.toInt()!)
    }
    
    func startRacing(racing: RacingInput) {
        if isValidInput(userInput: racing) == false {
            fatalError(RacingCarError.cannotConvertToInt.rawValue)
        }
        let roundCount = Int(racing.roundCount)!
        let carCount = Int(racing.playingCarCount)!
        for _ in 0...roundCount - 1 {
            let roundRecord: [String] = Array(0...carCount - 1)
                .map { String($0) }
                .reduce([]) { partialResult, _ in
                return partialResult + [isOverThree(number: getRandomNumber())]
            }
            roundRecorder.appendResult(record: roundRecord)
        }
    }
    
    func getRandomNumber() -> Int {
        return (0...9).randomElement()!
    }
    
    func isValidInput(userInput: RacingInput) -> Bool {
        let racingValidationCheck = RacingCarValidationCheck(userInput.playingCarCount,
                                                             userInput.roundCount)
        return racingValidationCheck.isIntAblestring()
    }
    
    func isOverThree(number: Int) -> String {
        return number > 3 ? "-" : ""
    }
}
