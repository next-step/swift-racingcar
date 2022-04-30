//
//  InputView.swift
//  RacingCar
//
//  Created by brian은석 on 2022/05/01.
//

import Foundation

struct InputView {
    func gameStart() throws -> (carCount:Int,attemptCount:Int) {
        GameSetting.carCount.showGuide()
        let carCount = try myReadLine()
        
        GameSetting.attemptCount.showGuide()
        let attemptCount = try myReadLine()
        return (carCount,attemptCount)
    }
    
    private func myReadLine() throws -> Int {
        guard let input: String = readLine(), let inputNumber = Int(input) else {
            let error = InputError.notNumber
            error.showError()
            throw error
        }
        return inputNumber
    }
    
}
