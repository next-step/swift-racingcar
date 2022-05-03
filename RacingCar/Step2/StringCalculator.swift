//
//  StringCalculator.swift
//  RacingCar
//
//  Created by brian은석 on 2022/04/28.
//

import Foundation

protocol Calculator { }

extension Calculator {
    fileprivate func add(lhs: Int, rhs: Int) -> Int {
        return lhs + rhs
    }
    fileprivate func subtract(lhs: Int, rhs: Int) -> Int {
        return lhs - rhs
    }
    fileprivate func multiply(lhs: Int, rhs: Int) -> Int {
        return lhs * rhs
    }
    fileprivate func divide(lhs: Int, rhs: Int) -> Int {
        return lhs / rhs
    }
}

struct StringCalculator: Calculator {
    private let inputChangeHelper = StringCalculatorInputChange()
    
    func caculate(input: String?) throws -> Int {
        let removeOptionalValue = try inputChangeHelper.removeOptional(input: input)
        let splitStringArray = try inputChangeHelper.split(input: removeOptionalValue)
        let removeEmpty = inputChangeHelper.removeEmpty(input: splitStringArray)
        let _ = try inputChangeHelper.inputStringArrayCountIsOdd(input: removeEmpty)
        var currentValue = 0
        var operate: Operator? = nil
        for (index,value) in removeEmpty.enumerated() {
            if !index.isMultiple(of: 2) {
                operate = try inputChangeHelper.convertOperator(input: value)
            } else {
                let changeInt = try inputChangeHelper.stringToInt(input: value)
                if let myOperate = operate {
                    switch myOperate {
                    case .plus:
                        currentValue = self.add(lhs: currentValue, rhs: changeInt)
                    case .minus:
                        currentValue = self.subtract(lhs: currentValue, rhs: changeInt)
                    case .multiplication:
                        currentValue = self.multiply(lhs: currentValue, rhs: changeInt)
                    case .division:
                        currentValue = self.divide(lhs: currentValue, rhs: changeInt)
                    }
                    operate = nil
                }
                if index == 0 {
                    currentValue = changeInt
                }
            }
        }
        return currentValue
    }
    
    
}
