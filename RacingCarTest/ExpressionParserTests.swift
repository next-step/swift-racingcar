//
//  ExpressionParserTests.swift
//  RacingCarTest
//
//  Created by Felix.mr on 2021/10/31.
//

import XCTest

class ExpressionParserTests: XCTestCase {

    var expressionParser: Parserable!
    
    override func setUp() {
        super.setUp()
        
        self.expressionParser = ExpressionParser()
    }
    
    override func tearDown() {
        super.tearDown()
        
        self.expressionParser = nil
    }
    
    func test_expression_parser_valid_input() {
        // Arrange
        let expression = "1 + 2"
        
        // Act
        let result = try? expressionParser.parse(expression: expression)
        
        // Assert
        XCTAssertEqual(["1", "+", "2"], result)
    }
    
    func test_expression_parser_invalid_input() {
        // Arrange
        let expression = ""
        
        // Act
        // Assert
        XCTAssertThrowsError(try expressionParser.parse(expression: expression))
    }
}
