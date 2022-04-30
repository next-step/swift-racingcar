//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
//

do {
    print("경주할 자동차 이름을 입력하세요(이름은 쉼표(,)를 기준으로 구분).")
    let carInfo = try InputView.readCarInfo()
    print(carInfo)
    
    print("시도할 횟수는 몇 회인가요? ")
    let gameCount = try InputView.readCount()
    
    let game = Game(cars: carInfo, counts: gameCount)
    game.run()
} catch let error as InputEror {
    print(error.debugDescription)
}
