//
//  ResultView.swift
//  RacingCar
//
//  Created by 조민호 on 2021/11/05.
//

import Foundation

struct ResultView {
    private let resultTitle = "실행 결과"
    
    func printResultTitle() {
        print("")
        print(resultTitle)
    }
    
    func printResult(name: String, position: String) {
        print("\(name) : \(position)")
    }
    
    func printWinner(winners: [String]) {
        let nameOfWinners = winners.joined(separator: ",")
        print("\(nameOfWinners)가 최종 우승했습니다.")
    }
}
