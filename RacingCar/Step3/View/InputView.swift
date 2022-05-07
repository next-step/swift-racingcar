//
//  InputView.swift
//  RacingCar
//
//  Created by brian은석 on 2022/05/01.
//

import Foundation

struct InputView {
    func carNamesSetting() -> String {
        print(GameGuide.carNames)
        guard let input: String = readLine() else {
            return ""
        }
        return input
    }
    
    func attemptSetting() throws -> Int {
        print(GameGuide.attemptCount, terminator: " ")
        let attemptCount = try readInput()
        try self.invalidNumberCheck(attemptCount)
        return attemptCount
    }
    
    private func readInput() throws -> Int {
        guard let input: String = readLine(), let inputNumber = Int(input) else {
            throw InputError.notNumber
        }
        return inputNumber
    }
    
    private func invalidNumberCheck(_ input:Int) throws {
        if input < 1 {
            throw InputError.invalidNumber
        }
    }
    
}
