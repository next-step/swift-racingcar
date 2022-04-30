//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
//

do {
    print("자동차 대수는 몇 대인가요? ", terminator: "")
    let carCount = try InputView.inputReadLine()
    
    print("시도할 횟수는 몇 회인가요? ", terminator: "")
    let gameCount = try InputView.inputReadLine()
    
    let game = Game(cars: carCount, counts: gameCount)
    game.run()
} catch let error as InputEror {
    print(error.debugDescription)
}
