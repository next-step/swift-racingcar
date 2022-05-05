//
//  GameSetting.swift
//  RacingCar
//
//  Created by brian은석 on 2022/05/01.
//

import Foundation

enum GameGuide {
    static let carCount = "자동차 대수는 몇 대인가요?"
    static let carNames = "경주할 자동차 이름을 입력하세요(이름은 쉼표(,)를 기준으로 구분)."
    static let attemptCount = "자동차 대수는 몇 대인가요?"
}

extension GameGuide {
    static func randomNumber() -> Int {
        return Int.random(in: 0...9)
    }
    static func rule(_ randomNumber: Int) -> Int {
        guard randomNumber >= 4 else { return 0 }
        return 1
    }
    static func splitComma(_ input: String) -> [String] {
        return input.split(separator: ",").map{String($0)}
    }
}
