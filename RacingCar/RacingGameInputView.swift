//
//  InputView.swift
//  RacingCar
//
//  Created by jinho jeong on 2022/04/29.
//

import Foundation

protocol RacingGameInput {
    func input() throws
    func inputCarCount() throws
    func inputGameCount() throws
    func registerSetting() -> GameSetting
    func validation(count: String) throws -> Int 
}

final class RacingGameInputView: RacingGameInput {
    
    let randomGenerator: RandomGettable
    private var carCount: Int = 0
    private var gameCount: Int = 0
    
    enum InputViewError: Error {
        case incorrectFormat
        case minusCount
        case input
    }
    
    init(randomGenerator: RandomGettable) {
        self.randomGenerator = randomGenerator
    }
    
    func input() throws {
        printQuestionCarCount()
        try inputCarCount()
        printQuestionGameCount()
        try inputGameCount()
    }
    
    func inputCarCount() throws {
        guard let input: String = readLine() else { throw InputViewError.input}
        let validatedGameCount = try validation(count: input)
        self.carCount = validatedGameCount
    }
    
    func inputGameCount() throws {
        guard let input: String = readLine() else { throw InputViewError.input}
        let validatedGameCount = try validation(count: input)
        self.gameCount = validatedGameCount
    }
    
    func validation(count: String) throws -> Int {
        guard let count = Int(count) else { throw InputViewError.incorrectFormat }
        guard count > 0  else { throw InputViewError.minusCount }
        return count
    }
    
    func printQuestionCarCount() {
        print("자동차 대수는 몇 대인가요?")
    }
    
    func printQuestionGameCount() {
        print("시도할 횟수는 몇 회인가요?")
    }
    
    func registerSetting() -> GameSetting {
        return GameSetting(gameCount: gameCount, carCount: carCount, randomGenerator: randomGenerator)
    }
    
}
