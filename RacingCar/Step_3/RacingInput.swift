//
//  RacingCar.swift
//  RacingCar
//
//  Created by 임현규 on 2021/11/02.
//

import Foundation

struct RacingInput {
    let playingCarCount: Int
    let roundCount: Int
    
    init(carCount: String, roundCount: String) {
        self.playingCarCount = Int(carCount)!
        self.roundCount = Int(roundCount)!
    }
}

enum Question: String {
    case firstQuestion = "자동차 대수는 몇 대인가요?"
    case secondQuestion = "시도할 횟수는 몇 회인가요?"
}

enum RacingCarError: String, Error {
    case firstInputError
    case secondInputError
}
