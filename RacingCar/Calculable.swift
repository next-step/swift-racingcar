//
//  Calculable.swift
//  RacingCar
//
//  Created by 카카오VX on 2022/04/25.
//

protocol Calculable {
    func calculate(expression: String)
    func calculated() -> Int
    func reset()
    func add(left leftNumber: Int, right rightNumber: Int)
    func subtract(left leftNumber: Int, right rightNumber: Int)
    func multiply(left leftNumber: Int, right rightNumber: Int)
    func divide(left leftNumber: Int, right rightNumber: Int)
}
