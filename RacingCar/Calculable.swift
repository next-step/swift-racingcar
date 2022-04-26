//
//  Calculable.swift
//  RacingCar
//
//  Created by 카카오VX on 2022/04/25.
//

protocol Calculable {
    func execute(expression: String) throws
    func calculate(left leftNumber: Int, right rightNumber: Int, operator: Calculator.CalcOperator)
    func calculated() -> Int
    func reset()
    func add(left leftNumber: Int, right rightNumber: Int)
    func subtract(left leftNumber: Int, right rightNumber: Int)
    func multiply(left leftNumber: Int, right rightNumber: Int)
    func divide(left leftNumber: Int, right rightNumber: Int)
    func splitCalcExpression(_ expression: String) -> (stack: [String], count: Int)
    func isValideCalcOperator(input stringOperators: String) throws
    func isValideInput(input expression: String) throws
}
