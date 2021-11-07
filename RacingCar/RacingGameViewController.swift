//
//  RacingCarViewController.swift
//  RacingCar
//
//  Created by 남기범 on 2021/11/07.
//

import Foundation

class RacingCarInputView {
    func inputCarCount() -> Int {
        print("자동차 대수는 몇 대인가요? ", separator: "")
        guard let carCount = Int(readLine()) else {
            return nil
        }
        
        return carCount
    }
    
    func inputTryCount() -> Int {
        print("시도할 횟수는 몇 회인가요? ", separator: "")
        guard let tryCount = Int(readLine()) else {
            return nil
        }
        
        return tryCount
    }
}

class RacingCarOutputView {
    func outputPrint(carPositions: [String]) {
        carPositions.forEach({ carPosition in
            print(carPositions)
        })
        
        print()
    }
}
