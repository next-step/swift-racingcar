//
//  StringCalculator.swift
//  RacingCar
//
//  Created by 김효성 on 2021/10/28.
//

/*
 사용자가 입력한 문자열 값에 따라 사칙연산을 수행할 수 있는 계산기를 구현해야 합니다.
 입력 문자열의 숫자와 사칙 연산자 사이에는 반드시 빈 공백 문자열이 있다고 가정합니다.
 나눗셈의 경우 결과 값을 정수로 떨어지는 값으로 한정합니다.
 문자열 계산기는 사칙연산의 계산 우선순위가 아닌 입력 값에 따라 계산 순서가 결정됩니다.
 즉, 수학에서는 곱셈, 나눗셈이 덧셈, 뺄셈 보다 먼저 계산해야 하지만 이를 무시합니다.
 예를 들어 2 + 3 * 4 / 2와 같은 문자열을 입력할 경우 2 + 3 * 4 / 2 실행 결과인 10을 출력해야 합니다.
 */

protocol ArithmeticProtocol {
    func add(_ lhs: Int, _ rhs: Int) -> Int
    func substract(_ lhs: Int, _ rhs: Int) -> Int
    func multiply(_ lhs: Int, _ rhs: Int) -> Int
    func devide(_ lhs: Int, _ rhs: Int) -> Int
}

protocol StringCalcuratorProtocol {
    func calcurate(_ string: String?) throws
}

final class StringCalcurator: StringCalcuratorProtocol {
    private enum InputError: Error {
final class StringCalcurator: StringCalcuratorProtocol, ArithmeticProtocol {
    enum InputError: Error {
        case `nil`
        case empty
        case noNumbers
        case noOperators
    }
    
    func calcurate(_ string: String?) throws {
        guard let string = string else { throw InputError.nil }
        guard string.isEmpty else { throw InputError.empty }
        let numbers = string
            .components(separatedBy: " ")
            .compactMap { $0 as? Int }
        let operators = string
            .components(separatedBy: " ")
            .filter { $0 == "+" || $0 == "-" || $0 == "*" || $0 == "/" }
    }
}

// MARK: - Private Function
extension StringCalcurator {
    private func add(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs + rhs
    }
    
    private func substract(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs - rhs
    }
    
    private func multiply(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs * rhs
    }
    
    private func devide(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs / rhs
    }
}
