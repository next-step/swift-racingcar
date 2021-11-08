//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

struct RacingCarGameController {
    private let carCountQuestionLabel = LabelView(title: "자동차 대수는 몇 대인가요?", terminator: " ")
    private let tryCountQuestionLabel = LabelView(title: "시도할 횟수는 몇 회인가요?", terminator: " ")
    private let newLineLabel = LabelView(title: " ")
    private let resultLabel = LabelView(title: "실행 결과")

    private var carCountInput = InputView()
    private var tryCountInput = InputView()
    
    mutating func run() {
        carCountQuestionLabel.printTitle()
        carCountInput.readInput()
        
        tryCountQuestionLabel.printTitle()
        tryCountInput.readInput()
        
        guard let carCount = Int(carCountInput.input),
              let tryCount = Int(tryCountInput.input),
              tryCount > 0
        else { return }
        
        newLineLabel.printTitle()
        
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
