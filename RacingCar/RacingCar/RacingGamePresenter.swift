//
//  RacingGamePresenter.swift
//  RacingCar
//
//  Created by Felix.mr on 2021/11/09.
//

import Foundation

protocol GamePresentable: AnyObject {
    
    func present(positions: [Positionable], as presentedString: String)
}

class RacingGamePresenter: GamePresentable {
    
    func present(positions: [Positionable], as presentedString: String) {
        positions.forEach {
            for _ in 0..<$0.position {
                print(presentedString, terminator: "")
            }
            print("🚘")
        }
    }
}
