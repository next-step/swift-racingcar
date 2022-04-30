//
//  InputView.swift
//  RacingCar
//
//  Created by 강수진 on 2022/04/28.
//

import Foundation

private enum Question: UserInformable {
    case carNames
    case raceCount
    
    var guideDescription: String {
        switch self {
        case .carNames:
            return "경주할 자동차 이름을 입력하세요(이름은 쉼표(,)를 기준으로 구분)"
        case .raceCount:
            return "시도할 횟수는 몇 회인가요?"
        }
    }
}

struct InputView {
    private let userGuider = UserGuider()
    private let stringConverter = StringConverter()
    private let userInputValidator = UserInputValidator()
    
    func recieveCarNames() throws -> [String] {
        userGuider.guide(for: Question.carNames)
        let carNames = readLine()?.components(separatedBy: ",") ?? []
        let isValidCarNames: Bool = userInputValidator.isValidCarNames(of: carNames)
        guard isValidCarNames else {
            throw UserInputError.invalidCarName
        }
        return carNames
    }
    
    func recieveRaceCount() throws -> Int {
        userGuider.guide(for: Question.raceCount)
        do {
            let raceCount = try stringConverter.convertToInt(from: readLine())
            let isValidRaceCount = userInputValidator.isValideRaceCount(of: raceCount)
            guard isValidRaceCount else {
                throw UserInputError.invalidRaceCount
            }
            return raceCount
        } catch {
            throw UserInputError.invalidRaceCount
        }
    }
}
