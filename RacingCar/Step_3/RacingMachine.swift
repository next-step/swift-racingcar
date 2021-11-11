//
//  RacingRecord.swift
//  RacingCar
//
//  Created by 임현규 on 2021/11/02.
//

import Foundation

struct RacingMachine {
    private let roundRecorder: RacingRecorder
    
    init(racingInput: RacingInput) {
        self.roundRecorder = RacingRecorder(roundCount: racingInput.roundCount.toInt() ?? 0)
    }
    
    func startRacing(racing: RacingInput) {
        if isValidInput(userInput: racing) == false {
            fatalError(RacingCarError.cannotConvertToInt.rawValue)
        }
        guard let roundCount = Int(racing.roundCount) else {
            fatalError(RacingCarError.cannotConvertToInt.rawValue)
        }
        guard let carCount = Int(racing.playingCarCount) else {
            fatalError(RacingCarError.cannotConvertToInt.rawValue)
        }
        for _ in 1 ... roundCount {
            let roundRecord = oneRoundRecord(carCount: carCount)
            roundRecorder.appendResult(record: roundRecord)
        }
    }
    
    func oneRoundRecord(carCount: Int) -> [String] {
        return Array(1 ... carCount)
            .map { String($0) }
            .reduce([]) { partialResult, _ in
            return partialResult + [isCanMoveForword(number: getRandomNumber())]
        }
    }
    
    func getRandomNumber() -> Int {
        return Int.random(in: 0...9)
    }
    
    func isValidInput(userInput: RacingInput) -> Bool {
        let racingValidationCheck = RacingCarValidationCheck(racingInput: userInput)
        return racingValidationCheck.isIntAblestring()
    }
    
    func isCanMoveForword(number: Int) -> String {
        let moveForword = "-"
        let dontMove = ""
        return number > 3 ? moveForword : dontMove
    }
}
