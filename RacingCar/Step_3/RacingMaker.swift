//
//  RacingCarMaker.swift
//  RacingCar
//
//  Created by 임현규 on 2021/11/02.
//

import Foundation

class RacingGame {
    private let racing: RacingInput
    
    private let machine: RacingMachine
    private let recorder: RacingRecorder
    
    init(racing: RacingInput) {
        self.racing = racing
        self.machine = RacingMachine()
        self.recorder = RacingRecorder(roundCount: racing.roundCount)
        setCallBack()
    }
    
    func setCallBack() {
        self.recorder.racingFinish = { [weak self] in
            guard let self = self else { return }
            print(self.recorder.racingResult())
        }
        self.machine.oneRoundEnded = { [weak self] roundRecord in
            guard let self = self else { return }
            self.recorder.appendResult(record: roundRecord)
        }
    }
    
    func startRacing() {
        machine.startRacing(racing: racing)
    }
}
