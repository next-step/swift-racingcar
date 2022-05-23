//
//  InputView.swift
//  RacingCar
//
//  Created by 김성준 on 2022/05/16.
//

import Foundation

enum InputError: Error {
    case moveCountInputCannotAssignToInt
    case InputError
    case carNameTooLong
    case carNamesInputCannotAssignToString
    case notEnoughCars
    case carNameIsEmpty
}

struct UserInput {
    var carNames: [String]
    var moveCount: Int
}

struct InputView {
    
    private let validator = RacingInputValidator()
    
    func input() -> UserInput? {
        do {
            let carNames = try nameInput()
            let moveCount = try moveCountInput()
            return UserInput(carNames: carNames, moveCount: moveCount)
        } catch {
            print(error)
        }
        return nil
    }
    
    private func nameInput() throws -> [String] {
        print("경주할 자동차 이름을 입력하세요(이름은 쉼표(,)를 기준으로 구분")
        do {
            return try validator.validCarNameLength(readLine())
        } catch {
            throw error
        }
    }
    
    private func moveCountInput() throws -> Int {
        print("시도할 횟수는 몇 회인가요?")
        let inputMoveCount = readLine()
        do {
            let count = try validator.validMoveCount(inputMoveCount)
            return count
        } catch {
            throw error
        }
    }
}

struct RacingInputValidator {
    
    func containsWrongLength(names: [String]) -> Bool {
        return names.filter{ $0.count > 5 }.isEmpty ? false : true
    }
    
    func validCarNameLength(_ inputString: String?) throws -> [String] {
        guard let inputString = inputString else {
            throw InputError.carNamesInputCannotAssignToString
        }
        
        guard inputString.contains(",") else {
            throw InputError.notEnoughCars
        }
        
        let carNames = inputString.components(separatedBy: ",")
        
        if carNames
            .filter({ $0.isEmpty })
            .count > 0 {
            throw InputError.carNameIsEmpty
        }
        
        guard containsWrongLength(names: carNames) == false else {
            throw InputError.carNameTooLong
        }
        return carNames
    }
    
    func validMoveCount(_ inputString: String?) throws -> Int{
        guard let inputString = inputString,
              let moveCount = Int(inputString) else {
            throw InputError.moveCountInputCannotAssignToInt
        }
        return moveCount
    }
}
