//
//  InputView.swift
//  RacingCar
//
//  Created by main on 2022/05/09.
//

import Foundation

final class InputView {
    private let userInteractor = UserInteractor()
    
    func getCarCount() throws -> Int {
        return try userInteractor.receiveInt("자동차 대수는 몇 대인가요? ")
    }
    
    func getRaceCount() throws -> Int {
        return try userInteractor.receiveInt("시도할 횟수는 몇 회인가요? ")
    }
}
