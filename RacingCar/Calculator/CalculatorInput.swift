//
//  CalculatorInput.swift
//  RacingCar
//
//  Created by 카카오VX on 2022/04/28.
//

import Foundation

struct CalculatorInput {
    static func readExpression() -> String {
        print("연산식을 입력해주세요.")
        let expression = readLine() ?? ""
        return expression
    }
}
