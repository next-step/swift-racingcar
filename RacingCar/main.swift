//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

let userInput = readLine()

//MARK: -- Step2
//guard let userInput = userInput else { fatalError(CalculatorError.inputNil.description) }
//guard userInput.isNotEmpty() else { fatalError(CalculatorError.emptyString.description) }
//let calculator = StringCalculator(userInput: userInput)
//let result = calculator.startStringCalculate()
//print(result)

//MARK: -- Step3
print(Question.firstQuestion.rawValue,terminator:" ")
guard let firstInput = readLine() else { fatalError(RacingCarError.playcarInputError.rawValue) }

print(Question.secondQuestion.rawValue, terminator: " ")
guard let secondInput = readLine() else { fatalError(RacingCarError.playcarInputError.rawValue) }

let racingInput = RacingInput(carCount: firstInput, roundCount: secondInput)
let racingGame = RacingGame(racing: racingInput)
racingGame.startRacing()
