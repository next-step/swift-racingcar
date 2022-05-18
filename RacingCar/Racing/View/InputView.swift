//
//  InputView.swift
//  RacingCar
//
//  Created by 김성준 on 2022/05/16.
//

import Foundation

enum InputError: String, Error {
    case carCountInputCannotAssignToInt
    case moveCountInputCannotAssignToInt
    case InputError
    case carNameTooLong
}

struct UserInput {
    var carCount: Int
    var moveCount: Int
}

struct InputView {
    
    func input() -> UserInput? {
        print("몇 대의 자동차가 레이싱에 참가합니까?")
        
        let carCountInput = readLine()
        
        print("몇 번의 이동을 해야 하나요?")
        
        let moveCountInput = readLine()
        
        do {
            let userInput = try userInput(carCount: carCountInput, moveCount: moveCountInput)
            return userInput
        } catch {
            return nil
        }
    }
    
    func userInput(carCount: String?, moveCount: String?) throws -> UserInput {
        guard let inputString = carCount,
              let carCount = Int(inputString) else {
            print(InputError.carCountInputCannotAssignToInt)
            throw InputError.carCountInputCannotAssignToInt
        }
                
        guard let inputString = moveCount,
              let moveCount = Int(inputString) else {
            print(InputError.moveCountInputCannotAssignToInt)
            throw InputError.moveCountInputCannotAssignToInt
        }
        
        return UserInput(carCount: carCount, moveCount: moveCount)
    }
    
struct RacingInputValidator {
    
    func containsWrongLength(names: [String]) -> Bool {
        return names.filter{ $0.count > 5 }.isEmpty ? false : true
    }
}
