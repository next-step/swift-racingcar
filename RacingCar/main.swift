//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

func main() {
    do {
        let gameInfo = GameInfo(players: try InputView.readPlayers(),
                                round: InputView.readRound())
        let forwardNumberMaker = RacingForwardRandomNumberMaker()
        RacingGame.play(gameInfo: gameInfo, forwardNumberMakable: forwardNumberMaker)
    }
    catch {
        print(InputError.outOfRange.message)
        main()
    }
}

main()
