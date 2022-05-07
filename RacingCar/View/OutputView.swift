//
//  OutputView.swift
//  RacingCar
//
//  Created by nylah.j on 2022/04/30.
//

struct OutputView {
    static func showGameResult(_ gameResult: String) {
        print("\n")
        print("실행 결과")
        print(gameResult)
    }
    
    static func showWinners(_ winners: String) {
        print("\n")
        print("\(winners)가 최종 우승했습니다.")
    }
    
    static func printError(_ error: Error) {
        print(error.localizedDescription)
    }
    
    static func inputIsNil() {
        print("입력된 값이 없습니다.")
    }
}
