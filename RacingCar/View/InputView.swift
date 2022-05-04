//
//  InputView.swift
//  RacingCar
//
//  Created by nylah.j on 2022/04/30.
//

struct InputView {
    private static let blankSpace = " "
    
    static func inputCarCount() -> Int? {
        print("자동차 대수는 몇 대인가요?", terminator: blankSpace)
        if let input: String = readLine(),
           let inputNumber = Int(input) {
           return inputNumber
        }
        return nil
    }
    
    static func inputRoundCount() -> Int? {
        print("시도할 횟수는 몇 회인가요?", terminator: blankSpace)
        if let input: String = readLine(),
           let inputNumber = Int(input) {
           return inputNumber
        }
        return nil
    }
}
