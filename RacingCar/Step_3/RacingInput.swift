//
//  RacingCar.swift
//  RacingCar
//
//  Created by 임현규 on 2021/11/02.
//

import Foundation

struct RacingInput {
    let playingCarCount: String
    let roundCount: String
    
    init(carCount: String, roundCount: String) {
        self.playingCarCount = carCount
        self.roundCount = roundCount
    }
}

enum Question: String {
    case firstQuestion = "자동차 대수는 몇 대인가요?"
    case secondQuestion = "시도할 횟수는 몇 회인가요?"
}

enum RacingCarError: String, Error {
    case playcarInputError
    case roundCountInputError
    case cannotConvertToInt
}
