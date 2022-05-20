//
//  RacingGame.swift
//  RacingCar
//
//  Created by 김성준 on 2022/05/20.
//

import Foundation

struct RacingGame {
    let inputView = InputView()
    
    func start() {
        let userInput = receiveUserInput()
        do {
            let racing = try Racing(userInput)
            racing?.start()
            
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
