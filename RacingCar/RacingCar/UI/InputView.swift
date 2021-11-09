//
//  InputView.swift
//  RacingCar
//
//  Created by itzel.du on 2021/11/10.
//

import Foundation

struct InputView {
    private(set) var input: String = ""
    
    mutating func readInput() {
        input = readLine() ?? ""
    }
}
