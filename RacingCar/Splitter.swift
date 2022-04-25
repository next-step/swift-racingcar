//
//  Split.swift
//  RacingCar
//
//  Created by brian은석 on 2022/04/26.
//

import Foundation

struct Splitter {
    func targetWithComma(_ input:String) -> [String] {
        return input.split(separator: ",").map{String($0)}
    }
    
    func targetWithBracketAndComma(_ input:String) -> String {
        let removeBracketLeft = input.replacingOccurrences(of: "(", with: "")
        let removeBracketRight = removeBracketLeft.replacingOccurrences(of: ")", with: "")
        return removeBracketRight
    }
}
