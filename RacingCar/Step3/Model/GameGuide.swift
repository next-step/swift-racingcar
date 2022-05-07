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
    static let attemptCount = "시도할 횟수는 몇 회인가요?"
}

extension GameGuide {
    static func randomNumber() -> Int {
        return Int.random(in: 0...9)
    }
    static func numberFourOrMorePlusOneOtherWisePlusZero(_ randomNumber: Int) -> Int {
        guard randomNumber >= 4 else { return 0 }
        return 1
    }
    static func splitComma(_ input: String) -> [String] {
        return input.components(separatedBy: ",").map{String($0)}
    }
    
    @discardableResult
    static func validCheck(_ carName: String) throws -> Bool {
        if carName.isEmpty {
            throw InputError.emptyName
        }
        if carName.count > 5 {
            throw InputError.overCountNameLength
        }
        return true
    }
    
    static func moveCars(model cars: [Car], round: Int) -> [Car] {
        guard round > 1 else { return cars }
        for car in cars {
            car.move(GameGuide.numberFourOrMorePlusOneOtherWisePlusZero(GameGuide.randomNumber()))
        }
        return cars
    }
}
