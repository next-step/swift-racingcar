//
//  RacingGameInputViewMock.swift
//  RacingCar
//
//  Created by jinho jeong on 2022/04/29.
//

import Foundation


final class RacingGameInputViewMock: RacingGameInput {
    
    
    var gameSetting: GameSetting = GameSetting(randomGenerator: RandomGenerator.init())
    private var carCount: Int = 0
    private var gameCount: Int = 0
    private var carNamesString = "Tayo,Bently,Benz,Bmw"
    enum InputViewError: Error {
        case incorrectFormat
        case minusCount
        case input
        case textLengthExceeded
    }
    
    init(gameSetting: GameSetting) {
        self.gameSetting = gameSetting
    }
    
    init(carNamesString: String) {
        self.carNamesString = carNamesString
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
    
    func validation(carNames: [String]) throws {
        guard carNames.filter({ $0.count > 5 }).count == 0 else { throw InputViewError.textLengthExceeded }
    }
    
    func input() throws {
        try inputCarNames()
        try inputGameCount()
    }
    
    @discardableResult
    func inputCarNames() throws -> [String] {
        printQuestionCarNames()
        return []
    }
    
    @discardableResult
    func inputGameCount() throws -> Int {
        printQuestionGameCount()
        print("\(gameSetting.gameCount)")
        return  0
    }
    
    func printQuestionCarNames() {
        print("경주할 자동차 이름을 입력하세요(이름은 쉼표(,)를 기준으로 구분).")
    }
    
    func printQuestionGameCount() {
        print("시도할 횟수는 몇 회인가요?")
    }
    
    func registerSetting() -> GameSetting {
        return gameSetting
    }

    
}
