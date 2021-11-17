//
//  InputView.swift
//  RacingCar
//
//  Created by sangsun on 2021/11/15.
//

import Foundation

struct InputView {
    
    static func insertCarCount() -> Int {
        print("자동차 대수는 몇 대인가요? ", terminator: "")
        guard let input = readLine(), let carCount = Int(input) else {
            print("입력값이 숫자가 아닙니다.")
            return -1
        }
        return carCount
    }
    
    static func insertTryCount() -> Int {
        print("시도할 횟수는 몇 회인가요? ", terminator: "")
        guard let input = readLine(), let count = Int(input) else {
            print("입력값이 숫자가 아닙니다.")
            return -1
        }
        return count
    }
}
