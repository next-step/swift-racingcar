//
//  ArithmeticOperator.swift
//  RacingCar
//
//  Created by Mephrine on 2021/11/01.
//

import Foundation

protocol ArithmeticOpearator {
	func operate(_ lhs: Int, _ rhs: Int) throws -> Int
}

struct Addition: ArithmeticOpearator {
	func operate(_ lhs: Int, _ rhs: Int) throws -> Int {
		lhs + rhs
	}
}

struct Subtraction: ArithmeticOpearator {
	func operate(_ lhs: Int, _ rhs: Int) throws -> Int {
		lhs - rhs
	}
}

struct Multiplication: ArithmeticOpearator {
	func operate(_ lhs: Int, _ rhs: Int) throws -> Int {
		lhs * rhs
	}
}

struct Division: ArithmeticOpearator {
	func operate(_ lhs: Int, _ rhs: Int) throws -> Int {
		lhs / rhs
	}
}

enum OpeatorSymbol: String {
	case addition = "+"
	case subtraction = "-"
	case multiplication = "*"
	case division = "/"
	
	func makeOperator() -> ArithmeticOpearator {
		switch self {
		case .addition:
			return Addition()
		case .subtraction:
			return Subtraction()
		case .multiplication:
			return Multiplication()
		case .division:
			return Division()
		}
	}
}

/// 야곰님은 아래와 같이 팩토리 함수를 만드셔서 사용하셨는데,
/// 이렇게 하면 혹시나 제곱근이 추가된 것을 모르고 해당 함수를 사용할 시,
/// invalidOperator 오류가 발생하여 컴파일 단계에서 막을 수 있던 오류가 논리 오류가 되어버리지 않을까???
/// 이 경우를 방지하기 위해서는 enum 구성이 좋을 것으로 보여 위와 같이 구성을 변경했다.
func makeOperator(symbol: String) throws -> ArithmeticOpearator {
	if symbol == "+" { return Addition() }
	if symbol == "-" { return Subtraction() }
	if symbol == "*" { return Multiplication() }
	if symbol == "/" { return Division() }
	throw ValueError.invalidOperator
}

// MARK: - enum은 한정적인 상황에서 사용해야한다.
/// enum은 '변경이 일어날 수 있는 부분'에서 사용하면 매우 번거로워진다.
/// 만약, 제곱근 등의 연산자가 추가되면 아래와 같이 많은 변경이 일어난다. -> 개방-폐쇄 원칙에 위배된다.
///  - 케이스 추가
///  - operate 스위치문 케이스 추가
///  - 제곱근 함수 추가
/// 이로 인해서 위와 같이  구성해봤다...인데 결국 enum하고 비슷해진 거 같다.... 조금 더 고민해보자.

//enum ArithmeticOpearator: String {
//	case addition = "+"
//	case subtraction = "-"
//	case multiplication = "*"
//	case division = "/"
//	case none
//
//	func operate(_ lhs: Int, _ rhs: Int) throws -> Int {
//		switch self {
//		case .addition:
//			return add(lhs, rhs)
//		case .subtraction:
//			return subtract(lhs, rhs)
//		case .multiplication:
//			return multiply(lhs, rhs)
//		case .division:
//			return divide(lhs, rhs)
//		case .none:
//			throw ValueError.invalidOperator
//		}
//	}
//
//	private func add(_ lhs: Int, _ rhs: Int) -> Int {
//		return lhs + rhs
//	}
//
//	private func subtract(_ lhs: Int, _ rhs: Int) -> Int {
//		return lhs - rhs
//	}
//
//	private func multiply(_ lhs: Int, _ rhs: Int) -> Int {
//		return lhs * rhs
//	}
//
//	private func divide(_ lhs: Int, _ rhs: Int) -> Int {
//		return lhs / rhs
//	}
//}
