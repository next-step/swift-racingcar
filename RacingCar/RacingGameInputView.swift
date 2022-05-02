//
//  InputView.swift
//  RacingCar
//
//  Created by jinho jeong on 2022/04/29.
//

import Foundation

protocol RacingGameInput {
    func input() throws
    func inputCarNames() throws -> [String]
    func inputGameCount() throws -> Int
    func registerSetting() -> GameSetting
    func validation(count: String) throws -> Int 
}

final class RacingGameInputView: RacingGameInput {
    
    let randomGenerator: RandomGettable
    private var carNames: [String] = []
    private var gameCount: Int = 0
    
    enum InputViewError: Error {
        case incorrectFormat
        case minusCount
        case input
        case textLengthExceeded
    }
    
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
        guard let input: String = readLine() else { throw InputViewError.input}
        let removeInput = removeSpacing(input: input)
        let carNames = splitCarNames(input: removeInput)
        return carNames
    }
    
    
    func inputGameCount() throws -> Int {
        guard let input: String = readLine() else { throw InputViewError.input}
        let validatedGameCount = try validation(count: input)
        return validatedGameCount
    }
    
    func splitCarNames(input: String) -> [String] {
        let carNames = input.split(separator: ",").map{ String($0)}
        return carNames
    }
    
    func removeSpacing(input: String) -> String {
        return input.replacingOccurrences(of: " ", with: "")
    }
    
   
    
    func validation(count: String) throws -> Int {
        guard let count = Int(count) else { throw InputViewError.incorrectFormat }
        guard count > 0 else { throw InputViewError.minusCount }
        return count
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
