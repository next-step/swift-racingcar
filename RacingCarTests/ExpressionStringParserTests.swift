//
//  ExpressionStringParserTests.swift
//  RacingCarTests
//
//  Created by itzel.du on 2021/10/31.
//

import XCTest
import RacingCar

class ExpressionStringParserTests: XCTestCase {
    func test_ExpressionStringParser_init_throwing_error() {
        let emptyInputs = [nil, ""]
        
        emptyInputs.forEach {
            initWithEmptyInputError(expressionString: $0)
        }
    }
    
    func test_ExpressionStringParser_init() {
        XCTAssertNoThrow(try ExpressionStringParser(expressionString: "1 + 2 - 3"))
    }
}

extension ExpressionStringParserTests {
    
    // TODO: 어떻게 nil, emptyString을 합쳐야 할지 모르겠어요
    func initWithEmptyInputError(expressionString: String?) {
        XCTAssertThrowsError(
            try ExpressionStringParser(expressionString: expressionString),
            "The ExpressionStringParser should have thrown an ExpressionInputError.emptyInput"
        ) { error in
            XCTAssertEqual(error as? ExpressionInputError, .emptyInput)
        }
    }
}
