//
//  RacingGame.swift
//  RacingCar
//
//  Created by 카카오VX on 2022/04/26.
//

import Foundation

struct RacingGame {
    static func play(gameInfo: RacingPlayable, forwardNumberMakable: RacingForwardNumberMakable) {
        let racing: RacingProtocol = Racing(gameInfo: gameInfo, forwardNumberMaker: forwardNumberMakable)
        let racingInfo = RacingInfo(racing: racing.play())
        ResultView.printRacingResult(printable: racingInfo)
    }
}
