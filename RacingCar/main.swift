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
if let racingCarCount = readLine(),
   let firstInputNumber = Int(racingCarCount) {
    print(Question.secondQuestion.rawValue,terminator:" ")
    if let attemptCount = readLine(),
       let secondInputNumber = Int(attemptCount) {
        
    }
}



