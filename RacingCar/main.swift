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
if let firstInputNumber = readLine() {
    print(Question.secondQuestion.rawValue, terminator: " ")
    if let secondInputNumber = readLine() {
        let userInput = RacingCar(carCount: firstInputNumber,
                                  roundCount: secondInputNumber)
        let printer = RacingCarPrinter(racingCar: userInput)
        print(printer.printRacingResult())
    }
}



