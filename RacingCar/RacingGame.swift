//
//  RacingGame.swift
//  RacingCar
//
//  Created by 김성준 on 2022/05/20.
//

import Foundation

final class RacingGame {
    private let inputView = InputView()
    private let resultView = ResultView()

    func start() {
        let userInput = receiveUserInput()
        do {
            let racing = try Racing(userInput)
            racing.delegate = self
            racing.start()
            
        } catch {
            print(error)
        }
    }
    
    func receiveUserInput() -> UserInput {
        var userInput: UserInput?
        repeat {
            userInput = inputView.input()
        } while userInput == nil
        
        return userInput!
    }
}

// MARK: - RacingDelegate
extension RacingGame: RacingDelegate {
    func racingProgress(participatedCars: [Car]) {
        resultView.printProgress(participatedCars)
    }
    
    func racingEnd(winnerCars: [Car]) {
        resultView.printGameResult(winnerCars: winnerCars)
    }
}
