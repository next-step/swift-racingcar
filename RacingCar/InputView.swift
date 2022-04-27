//
//  InputView.swift
//  RacingCar
//
//  Created by 카카오VX on 2022/04/26.
//

import Foundation

struct InputView {
    static func readCarNumber() -> Int {
        print("자동차 대수는 몇 대인가요?")
        let carNumber = readLine() ?? ""
        return Int(carNumber) ?? 0
    }
    
    static func readMatchNumber() -> Int {
        print("시도할 횟수는 몇 회인가요?")
        let matchNumber = readLine() ?? ""
        return Int(matchNumber) ?? 0
    }
}
