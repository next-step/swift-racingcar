//
//  RacingGameController.swift
//  RacingCar
//
//  Created by 임현규 on 2021/11/13.
//

import Foundation

struct RacingGameController {
    func initGame() {
        let carCount = printQuestion(question: Question.firstQuestion)
        let roundCount = printQuestion(question: Question.secondQuestion)
        let racingInput = RacingInput(carCount: carCount,
                                      roundCount: roundCount)
        let racingGame = RacingGame(racing: racingInput)
        racingGame.startRacing()
    }
    
    func printQuestion(question: Question) -> String {
        let questionText = TextView(text: question.rawValue, terminator: " ")
        questionText.printText()
        
        let input = readLine() ?? ""
        return input
    }
}
