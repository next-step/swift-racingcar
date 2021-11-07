//
//  ExpressionParser.swift
//  RacingCar
//
//  Created by Felix.mr on 2021/11/07.
//

import Foundation

protocol Parserable {
    
    func parse(expression: String) throws -> [String]
}

class ExpressionParser: Parserable {
    
    enum ParsingError: Error {
        
        case emptyInput
    }
    
    func parse(expression: String) throws -> [String] {
        guard !expression.isEmpty
        else { throw ParsingError.emptyInput }
        
        return expression.components(separatedBy: " ")
    }
}
