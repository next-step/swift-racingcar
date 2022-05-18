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
    case carNamesInputCannotAssignToString
}

struct UserInput {
    var carNames: [String]
    var moveCount: Int
}

/*
 각 자동차에 이름을 부여할 수 있습니다. 자동차 이름은 5자를 초과할 수 없습니다.
 전진하는 자동차를 출력할 때 자동차 이름을 같이 출력합니다.
 자동차 이름은 쉼표(,)를 기준으로 구분합니다.
 자동차 경주 게임을 완료한 후 누가 우승했는지를 알려줍니다. 우승자는 한 명 이상일 수 있습니다.
 */
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
            throw InputError.carCountInputCannotAssignToInt
        }
        
        let carNames = inputString.components(separatedBy: ",")
        
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
