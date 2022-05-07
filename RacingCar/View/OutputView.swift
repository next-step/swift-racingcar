//
//  OutputView.swift
//  RacingCar
//
//  Created by nylah.j on 2022/04/30.
//

struct OutputView {
    static func show(_ gameResult: String) {
        print("\n")
        print("실행 결과")
        print(gameResult)
    }
    
    static func carCountIsInvalid() {
        print("자동차 대수는 양의 정수여야 합니다.")
    }
    
    static func roundCountIsInvalid() {
        print("시도할 횟수는 양의 정수여야 합니다.")
    }
    
    static func carNameIsLongerThan(validLength: Int, invalidName: String) {
        print("자동차 이름은 \(validLength)이하여야 합니다. 잘못된 이름: \(invalidName)")
    }
    
    static func printError(_ error: Error) {
        print(error.localizedDescription)
    }
    
    static func inputIsNil() {
        print("입력된 값이 없습니다.")
    }
}
