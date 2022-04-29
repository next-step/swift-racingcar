//
//  InputView.swift
//  RacingCar
//
//  Created by 강수진 on 2022/04/28.
//

import Foundation

private struct UserAsker {
    
    enum Question {
        case carCount
        case raceCount
        
        var userGuideDescription: String {
            switch self {
            case .carCount:
                return "자동차 대수는 몇 대인가요?"
            case .raceCount:
                return "시도할 횟수는 몇 회인가요?"
            }
        }
    }
    
    func ask(for question: Question) {
        print(question.userGuideDescription)
    }
}

struct InputView {
    
    private let userAsker = UserAsker()
    private let stringConverter = StringConverter()
    
    func recieveCarCount() throws -> Int {
        userAsker.ask(for: .carCount)
        return try stringConverter.convertToInt(from: readLine())
    }
    
    func recieveRaceCount() throws -> Int {
        userAsker.ask(for: .raceCount)
        return try stringConverter.convertToInt(from: readLine())
    }
}
