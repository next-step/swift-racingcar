//
//  UserInteractor.swift
//  RacingCar
//
//  Created by main on 2022/05/09.
//

import Foundation

enum UserInteractorError: Error {
    case stringToIntFail
    case readLineFail
}

final class UserInteractor {
    func receiveInt(_ question: String?) throws -> Int {
        if let question = question {
            print(question)
        }
        
        guard let inputString = readLine() else {
            throw UserInteractorError.readLineFail
        }
        
        guard let inputInt = Int(inputString) else {
            throw UserInteractorError.stringToIntFail
        }
        
        return inputInt
    }
}
