//
//  InputView.swift
//  RacingCar
//
//  Created by 강수진 on 2022/04/28.
//

import Foundation

private struct UserAsker {
    
    enum Question: String {
        case carCount = "자동차 대수는 몇 대인가요?"
        case raceCount = "시도할 횟수는 몇 회인가요?"
    }
    
    func ask(for question: Question) {
        print(question.rawValue)
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
