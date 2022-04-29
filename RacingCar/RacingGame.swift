//
//  RacingGame.swift
//  RacingCar
//
//  Created by 카카오VX on 2022/04/26.
//

import Foundation

struct RacingGame {
    static func play(gameInfo: RacingPlayable, forwardNumberMakable: RacingForwardNumberMakable) {
        let racing = Racing(gameInfo: gameInfo, forwardNumberMaker: forwardNumberMakable).play()
        let racingInfo = RacingInfo(racing: racing)
        ResultView.racingResult(printable: racingInfo)
    }
}
