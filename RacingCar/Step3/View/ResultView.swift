//
//  ResultView.swift
//  RacingCar
//
//  Created by main on 2022/05/09.
//

import Foundation

final class ResultView {
    private let userInteractor = UserInteractor()
    
    func printTitle() {
        print("실행 결과")
        print("\n")
    }
    
    func printResult(result: [CarState]) {
        userInteractor.printRaceStates(cars: result)
    }
}
