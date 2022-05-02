//
//  StringCalculator.swift
//  RacingCar
//
//  Created by swave on 2022/04/30.
//

import Foundation

//MARK: 연산자
enum Operator: String {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
}

//MARK: 문자열 계산기 에러
// 문자열 계산기에서 발생할 수 있는 에러
enum  StringCalculatorError: Error {
    case invalidOperator   // 잘못된 연산자
    case invalidInputString // 잘못된 입력값
    case DividedValueIsNotInteger // 나눗셈 결과값이 정수가 아님
}


//MARK: 문자열 계산기
class StringCalculator {
    
    
    // 문자열 계산하기
    func calculate(string inputString: String) throws -> Int{
        
        //공백으로 문자열 나누기
        let splitedStrings: [String] = split(string: inputString)
       
       
        var index: Int = 1
        let length: Int = splitedStrings.count
        var result: Int = try splitedStrings[0].toInt()
        
        repeat {
            let lhs: Int = result
            let rhs: Int = try splitedStrings[index + 1].toInt()
            let calculateTwoInt: CalculateTwoInt = try getOperator(operator: splitedStrings[index])
            
            result = try calculateTwoInt(lhs, rhs)
            index = index + 2
            
        }while(index < length)
        
        return result
    }
    
    
    // 문자열 나누기
    //Q. 공백으로 나누는거니까 splitBySpace(string:) 이 더 괜찮을까요?
    private func split(string inputString: String) -> [String] {
        return inputString.components(separatedBy: " ")
    }
    
    // 연산자에 맞는 함수를 리턴
    private func getOperator(operator rawValue: String) throws -> CalculateTwoInt {
        
        switch Operator(rawValue: rawValue) {
        case .add: return add
        case .subtract: return subtract
        case .multiply: return multiply
        case .divide: return divide
            
        default:
            throw StringCalculatorError.DividedValueIsNotInteger
        }
    }
}

// 사칙연산
extension StringCalculator {
    typealias CalculateTwoInt = (Int, Int) throws -> Int
    
    /// 더하기
    private func add(lhs: Int, rhs: Int) -> Int {
        return lhs + rhs
    }
    /// 빼기
    private func subtract(lhs: Int, rhs: Int) -> Int {
        return lhs - rhs
    }
    
    /// 곱하기
    private func multiply(lhs: Int, rhs: Int) -> Int {
        return lhs * rhs
    }

    /// 나누기
    private func divide(lhs: Int, rhs: Int) throws -> Int {
        
        //나눗셈의 경우 결과 값을 정수로 떨어지는 값으로 한정
        if ((lhs % rhs) == 0){
            return lhs / rhs
        }
        throw StringCalculatorError.DividedValueIsNotInteger
    }
    
}

//MARK: - String extension

extension String {
    
    func toInt() throws ->  Int {
        guard let intValue: Int = Int(self) else {
            print("invalidInputString :" + self)
            throw StringCalculatorError.invalidInputString
        }
        return intValue
    }
}
