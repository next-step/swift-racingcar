//
//  InputView.swift
//  RacingCar
//
//  Created by 카카오VX on 2022/04/26.
//

import Foundation

struct InputView {
    static func readPlayers() throws -> [String] {
        print("경주할 자동차 이름을 입력하세요. (이름은 쉼표(,)를 기준으로 구분)")
        let players = (readLine() ?? "").components(separatedBy: ",")
        
        for player in players {
            if player.count > 5 {
                throw InputError.outOfRange
            }
        }
        
        return players
    }
    
    static func readRound() -> Int {
        print("시도할 횟수는 몇 회인가요?")
        let matchNumber = readLine() ?? ""
        return Int(matchNumber) ?? 0
    }
}
