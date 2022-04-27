//
//  RacingGame.swift
//  RacingCar
//
//  Created by 카카오VX on 2022/04/26.
//

import Foundation

struct RacingGame {
    static func play(_ gameInfo: RacingPlayable) {
        let racing = Racing.play(gameInfo: gameInfo)
        let racingInfo = RacingInfo(racing: racing)
        ResultView.printRacingResult(printable: racingInfo)
    }
}
