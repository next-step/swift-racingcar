//
//  InputView.swift
//  RacingCar
//
//  Created by 강수진 on 2022/04/28.
//

import Foundation

private enum Question: UserInformable {
    case carCount
    case raceCount
    
    var guideDescription: String {
        switch self {
        case .carCount:
            return "자동차 대수는 몇 대인가요?"
        case .raceCount:
            return "시도할 횟수는 몇 회인가요?"
        }
    }
}

struct InputView {
    
    private let userGuider = UserGuider()
    private let stringConverter = StringConverter()
    
    func recieveCarCount() throws -> Int {
        userGuider.guide(for: Question.carCount)
        return try stringConverter.convertToInt(from: readLine())
    }
    
    func recieveRaceCount() throws -> Int {
        userGuider.guide(for: Question.raceCount)
        return try stringConverter.convertToInt(from: readLine())
    }
}
