//
//  ExpressionStringParser.swift
//  RacingCar
//
//  Created by itzel.du on 2021/10/31.
//

import Foundation

struct ExpressionStringParser {
    private let expressionString: String
    
    init(expressionString: String?) throws {
        guard let expressionString = expressionString,
              !expressionString.isEmpty
        else { throw ExpressionInputError.emptyInput }
        
        self.expressionString = expressionString
    }
    
    func parse(separatedBy separator: String) -> [String] {
        expressionString.components(separatedBy: separator)
    }
}
