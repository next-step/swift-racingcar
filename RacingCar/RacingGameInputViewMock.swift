//
//  RacingGameInputViewMock.swift
//  RacingCar
//
//  Created by jinho jeong on 2022/04/29.
//

import Foundation


final class RacingGameInputViewMock: RacingGameInput {
    let gameSetting: GameSetting
    private var carCount: Int = 0
    private var gameCount: Int = 0
    
    enum InputError: Error {
        case incorrectFormat
    }
    
    init(gameSetting: GameSetting) {
        self.gameSetting = gameSetting
    }
    
    func input() throws {
        try inputCarCount()
        try inputGameCount()
    }
    
    func inputCarCount() throws {
        printQuestionCarCount()
        print("\(carCount)")
    }
    
    func inputGameCount() throws {
        printQuestionGameCount()
        print("\(gameCount)")
    }
    
    func printQuestionCarCount() {
        print("자동차 대수는 몇 대인가요?")
    }
    
    func printQuestionGameCount() {
        print("시도할 횟수는 몇 회인가요?")
    }
    
    func registerSetting() -> GameSetting {
        return gameSetting
    }

    
}
