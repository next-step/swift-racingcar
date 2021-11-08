//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

struct RacingCarGameController {
    private let newLineLabel = LabelView(title: " ")
    
    mutating func run() {
        guard let carCount = printQuestionAndGetCount(question: "자동차 대수는 몇 대인가요?"),
              let tryCount = printQuestionAndGetCount(question: "시도할 횟수는 몇 회인가요?"),
              tryCount > 0
        else { return }
        
        newLineLabel.printTitle()
        
        printRacingCarGameResuts(withCarCount: carCount, tryCount: tryCount)
    }
    
    func printQuestionAndGetCount(question: String) -> Int? {
        let questionLabel = LabelView(title: question, terminator: " ")
        questionLabel.printTitle()
        
        var countInput = InputView()
        countInput.readInput()
        
        return Int(countInput.input)
    }
    
    func printRacingCarGameResuts(withCarCount carCount: Int, tryCount: Int) {
        let resultLabel = LabelView(title: "실행 결과")
        resultLabel.printTitle()
        
        var racingCarGame = makeRacingCarGame(withRacingCarCount: carCount)
        
        (0..<tryCount).forEach { index in
            racingCarGame?.tryMovingRacingCarsWithRandomNumbers()
            racingCarGame?.racingCarPositions.forEach { position in
                printPosition(with: position.position)
            }
            
            if index < tryCount {
                newLineLabel.printTitle()
            }
        }
    }
    
    func makeRacingCarGame(withRacingCarCount count: Int) -> RacingCarGame? {
        guard count > 0 else { return nil }
        
        let racingCarMover = RacingCarMover(
            racingCar: RacingCar(position: Position(position: 0, distanceUnit: 1)),
            moveChecker: MoveChecker(movableRange: Range<Int>(4...9))
        )
        
        let racingCarGame = RacingCarGame(
            randomRange: Range<Int>(0...9),
            racingCarMovers: (0..<count).map { _ in racingCarMover }
        )
        
        return racingCarGame
    }
    
    func printPosition(with position: Int) {
        let title = position > 0 ? (0..<position).map { _ in "-" }.reduce("") { $0 + $1 } : "."
        let positionLabel = LabelView(title: title)
        positionLabel.printTitle()
    }
}


var controller = RacingCarGameController()
controller.run()
