//
//  RacingInfo.swift
//  RacingCar
//
//  Created by 카카오VX on 2022/04/27.
//

import Foundation

struct RacingInfo: RacingResultPrintable {
    private var info: [[AbleToRace]]
    
    init(racing info: [[AbleToRace]]) {
        self.info = info
    }
    
    func racingInfo() -> [[AbleToRace]] {
        info
    }
    
    func winnerGroup() -> [AbleToRace] {
        guard let lastMatchInfo = info.last else { return [] }
        return self.award(lastMatchInfo: lastMatchInfo)
    }
    
    private func award(lastMatchInfo: [AbleToRace]) -> [AbleToRace] {
        let maxCount: Int = findMaxMoveCount(lastMatchInfo: lastMatchInfo)
        let winnerGroup: [AbleToRace] = findWinnerGroup(lastMatchInfo: lastMatchInfo, maxCount: maxCount)
    
        return winnerGroup
    }
    
    private func findMaxMoveCount(lastMatchInfo: [AbleToRace]) -> Int {
        var maxCount: Int = 0
        
        for racer in lastMatchInfo {
            if racer.moveCountByRacer() > maxCount {
                maxCount = racer.moveCountByRacer()
            }
        }
        
        return maxCount
    }
    
    private func findWinnerGroup(lastMatchInfo: [AbleToRace], maxCount: Int) -> [AbleToRace] {
        var winnerGroup: [AbleToRace] = []
        
        for racer in lastMatchInfo {
            if racer.moveCountByRacer() == maxCount {
                winnerGroup.append(racer)
            }
        }
        
        return winnerGroup
    }
}
