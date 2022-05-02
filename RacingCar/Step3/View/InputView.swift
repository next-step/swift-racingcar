//
//  InputView.swift
//  RacingCar
//
//  Created by brian은석 on 2022/05/01.
//

import Foundation

struct InputView {
    func gameStart() throws -> (carCount:Int,attemptCount:Int) {
        print(GameGuide.carCount, terminator: " ")
        let carCount = try myReadLine()
        try self.isValidNumber(carCount)
        
        print(GameGuide.attemptCount, terminator: " ")
        let attemptCount = try myReadLine()
        try self.isValidNumber(attemptCount)
        
        return (carCount,attemptCount)
    }
    
    private func myReadLine() throws -> Int {
        guard let input: String = readLine(), let inputNumber = Int(input) else {
            throw InputError.notNumber
        }
        return inputNumber
    }
    
    func isValidNumber(_ input:Int) throws {
        if input < 1 {
            throw InputError.invalidNumber
        }
    }
    
}
