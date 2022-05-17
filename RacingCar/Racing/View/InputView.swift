//
//  InputView.swift
//  RacingCar
//
//  Created by 김성준 on 2022/05/16.
//

import Foundation

struct UserInput {
    var carCount: Int
    var moveCount: Int
}

struct InputView {
    
    static func input() -> UserInput {
        print("몇 대의 자동차가 레이싱에 참가합니까?")
        let carCount = Int(readLine()!)!
        
        print("몇 번의 이동을 해야 하나요?")
        let moveCount = Int(readLine()!)!
        
        return UserInput(carCount: carCount, moveCount: moveCount)
    }
    
}
