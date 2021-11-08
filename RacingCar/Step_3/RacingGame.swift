//
//  RacingCarMaker.swift
//  RacingCar
//
//  Created by 임현규 on 2021/11/02.
//

import Foundation

struct RacingGame {
    private let racing: RacingInput
    private let machine: RacingMachine
    
    init(racing: RacingInput) {
        self.racing = racing
        self.machine = RacingMachine(racingInput: racing)
    }
    
    func startRacing() {
        machine.startRacing(racing: racing)
    }
}
