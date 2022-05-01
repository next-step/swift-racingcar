//
//  GameSetting.swift
//  RacingCar
//
//  Created by brian은석 on 2022/05/01.
//

import Foundation

enum GameGuide {
    case carCount
    case attemptCount
    
    var description: String {
        switch self {
        case .carCount:
            return "자동차 대수는 몇 대인가요?"
        case .attemptCount:
            return "시도할 횟수는 몇 회인가요?"
        }
    }
}

extension GameGuide {
    func showGuide() {
        print(self.description, terminator: " ")
    }
    
    static func rule(_ attemptRound: Int) -> Int {
        if attemptRound == 1 {
            return 1
        }
        let randomNumber = Int.random(in: 0...9)
        guard randomNumber >= 4 else { return 0 }
        return 1
    }
}
