//
//  InputView.swift
//  RacingCar
//
//  Created by brian은석 on 2022/05/01.
//

import Foundation

struct InputView {
    func gameStart() throws -> (carCount:Int,attemptCount:Int) {
        GameGuide.carCount.showGuide()
        let carCount = try myReadLine()
        try self.isValidNumber(carCount)
        
        GameGuide.attemptCount.showGuide()
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
    
    private func isValidNumber(_ input:Int) throws {
        if input < 1 {
            throw InputError.invalidNumber
        }
    }
    
}
