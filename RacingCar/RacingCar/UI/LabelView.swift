//
//  LabelView.swift
//  RacingCar
//
//  Created by itzel.du on 2021/11/10.
//

import Foundation

struct LabelView {
    let title: String
    let terminator: String
    
    init(title: String, terminator: String = "\n") {
        self.title = title
        self.terminator = terminator
    }
    
    func printTitle() {
        print(title, terminator: terminator)
    }
}
