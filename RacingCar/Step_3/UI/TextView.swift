//
//  TextView.swift
//  RacingCar
//
//  Created by 임현규 on 2021/11/13.
//

import Foundation

struct TextView {
    let text: String
    let terminator: String
    
    init(text: String, terminator: String) {
        self.text = text
        self.terminator = terminator
    }
    
    func printText() {
        print(text, terminator: terminator)
    }
}
