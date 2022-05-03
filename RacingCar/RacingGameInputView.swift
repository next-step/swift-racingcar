//
//  InputView.swift
//  RacingCar
//
//  Created by jinho jeong on 2022/04/29.
//

import Foundation


final class RacingGameInputView: RacingGameInput {
    let checker: RacingGameInputChecker = RacingGameInputChecker()
    let randomGenerator: RandomGettable
    private var carNames: [String] = []
    private var gameCount: Int = 0
    
    
    
    init(randomGenerator: RandomGettable) {
        self.randomGenerator = randomGenerator
    }
    
    func input() throws {
        printQuestionCarNams()
        self.carNames =  try inputCarNames()
        printQuestionGameCount()
        self.gameCount = try inputGameCount()
    }
    
    func inputCarNames() throws -> [String] {
        let input: String = try checker.converter.converToUnwrapper(value: readLine())
        let carNames = splitCarNames(input: input)
        try checker.validator.checkValidation(carNames: carNames)
        return carNames
    }
    
    func inputGameCount() throws -> Int {
        let input: String = try checker.converter.converToUnwrapper(value: readLine())
        let count: Int = try checker.converter.converterToInteger(input: input)
        try checker.validator.checkValidation(count: count)
        return count
    }
    
    func splitCarNames(input: String) -> [String] {
        let carNames = input
            .replacingOccurrences(of: " ", with: "")
            .split(separator: ",").map{ String($0)}
        return carNames
    }
    
   
    func printQuestionCarNams() {
        print("경주할 자동차 이름을 입력하세요(이름은 쉼표(,)를 기준으로 구분).")
    }
    
    func printQuestionGameCount() {
        print("시도할 횟수는 몇 회인가요?")
    }
    
    func registerSetting() -> GameSetting {
        return GameSetting(gameCount: gameCount, carNames: carNames, randomGenerator: randomGenerator)
    }
    
}
