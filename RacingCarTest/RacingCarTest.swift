//
//  RacingCarTest.swift
//  RacingCarTest
//
//  Created by 카카오VX on 2022/04/27.
//

import XCTest

class RacingCarTest: XCTestCase {
    struct GameInfoMock: RacingPlayable  {
        func racingGameCarNumber() -> Int {
            3
        }
        
        func racingGameMatchNumber() -> Int {
            5
        }
    }
    
    struct RacingMock {
        static func play(gameInfo: RacingPlayable) -> [[Int]] {
            var gameResult = [[Int]]()
            var matchResult = [Int](repeating: 0, count: gameInfo.racingGameCarNumber())
            
            for _ in 0..<gameInfo.racingGameMatchNumber() {
                for car in 0..<gameInfo.racingGameCarNumber() {
                    matchResult[car] += 1
                }
                gameResult.append(matchResult)
            }
            
            return gameResult
        }
    }
    
    struct ResultViewMock {
        static func convertNumberToLine(move: Int) -> String {
            var line = ""
            
            for _ in 0..<move {
                line += "-"
            }
            
            return line
        }
    }
    
    private let gameInfo = GameInfoMock()
    
    func testRacingGamePlay() {
        let racing = RacingMock.play(gameInfo: gameInfo)
        
        XCTAssertEqual(racing, [[1, 1, 1], [2, 2, 2], [3, 3, 3], [4, 4, 4], [5, 5, 5]])
    }
    
    func testRacingMoveThreeTimesToLineString() {
        let moveThreeTimes: Int = 3
        let moveThreeTimesResult = ResultViewMock.convertNumberToLine(move: moveThreeTimes)
        
        XCTAssertEqual(moveThreeTimesResult, "---")
    }
    
    func testRacingMoveTwoTimesToLineString() {
        let moveThreeTimes: Int = 2
        let moveThreeTimesResult = ResultViewMock.convertNumberToLine(move: moveThreeTimes)
        
        XCTAssertEqual(moveThreeTimesResult, "--")
    }
    
    func testRacingMoveOneTimesToLineString() {
        let moveThreeTimes: Int = 1
        let moveThreeTimesResult = ResultViewMock.convertNumberToLine(move: moveThreeTimes)
        
        XCTAssertEqual(moveThreeTimesResult, "-")
    }
}
