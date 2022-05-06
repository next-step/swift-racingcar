//
//  InputView.swift
//  RacingCar
//
//  Created by nylah.j on 2022/04/30.
//

struct InputView {
    private static let blankSpace = " "
    private static let comma = ","
    
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
    
    static func inputName() -> [String]? {
        print("경주할 자동차 이름을 입력하세요(이름은 쉼표(,)를 기준으로 구분).")
        guard let input: String = readLine() else {
            return nil
        }
        let inputNames = input.components(separatedBy: comma)
        return inputNames
    }
}
