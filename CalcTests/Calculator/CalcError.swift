//
//  CalcError.swift
//  CalcTests
//
//  Created by ycsong on 2022/04/27.
//

enum CalcError: Error {
    case zeroOrNagativeDivide
    case nilOrEmpty
    case invalidOperation
    case invalidExpression
}
