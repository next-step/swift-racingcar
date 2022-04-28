//
//  InputView.swift
//  RacingCar
//
//  Created by jinho jeong on 2022/04/29.
//

import Foundation


final class InputView {
    
    enum InputError: Error {
        case incorrectFormat
    }
    
    
    private var carCount: Int = 0
    private var gameCount: Int = 0
    
    func input() throws {
        try inputCarCount()
        try inputGameCount()
    }
    
    func inputCarCount() throws {
        printQuestionCarCount()
        if let input: String = readLine(), let carCount = Int(input)
            {
            self.carCount = carCount
        } else {
           throw InputError.incorrectFormat
        }
    }
    
    func inputGameCount() throws {
        printQuestionGameCount()
        if let input: String = readLine(),let gameCount = Int(input)
            {
            self.gameCount = gameCount
        } else {
            throw InputError.incorrectFormat
        }
    }
    
    func printQuestionCarCount() {
        print("자동차 대수는 몇 대인가요?")
    }
    
    func printQuestionGameCount() {
        print("시도할 횟수는 몇 회인가요?")
    }
    
    func getGameSetting() -> GameSetting {
        return GameSetting(gameCount: gameCount, carCount: carCount)
    }
    
}
