//
//  InputView.swift
//  RacingCar
//
//  Created by 조민호 on 2021/11/04.
//

import Foundation

struct InputView {
    
    let numberOfCars = "자동차 대수는 몇 대인가요?"
    let numberOfAttempts = "시도할 횟수는 몇 회인가요?"
    
    func inputNumberOfCars() {
        if let input: String = readLine(),
           let inputNumber = Int(input) {
            
        }
    }
    
    func inputNumberOfAttempts() {
        if let input: String = readLine(),
           let inputNumber = Int(input) {
            
        }
    }
}
