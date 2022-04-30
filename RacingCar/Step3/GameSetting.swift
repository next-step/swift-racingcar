//
//  GameSetting.swift
//  RacingCar
//
//  Created by brian은석 on 2022/05/01.
//

import Foundation

enum GameSetting {
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

extension GameSetting {
    func showGuide() {
        print(self.description, terminator: " ")
    }
}
