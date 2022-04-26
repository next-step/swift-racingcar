//
//  StringTest.swift
//  RacingCarTest
//
//  Created by 김성준 on 2022/04/26.
//

import XCTest
@testable import RacingCar

class StringTest: XCTestCase {
    //정수변환이_가능한_숫자_두_개를_가진
    func test정수_두개와_구분자를_가진_문자열을_split_하면_두개_요소_배열로_반환되는가() {
        //given
        let onetwo = "1,2"
        let separator: Character = ","
        
        //when
        let result = StringControl.split(string: onetwo, separator: separator)
        
        //then
        XCTAssertEqual(result, ["1","2"])
    }
    
    //1개의 정수로 변환이 가능한 문자열을split하면 단일요소 배열이 반환되는가
    //
    func test정수_하나만_가진_문자열을_split_하면_단일요소_배열이_반환되는가() {
        //given
        let one = "1"
        let separator: Character = ","
        
        //when
        let result = StringControl.split(string: one, separator: separator)
        
        //then
        XCTAssertEqual(result, ["1"])
    }
    //"(1,2)" 값이 주어졌을 때 String의 replacingOccurrences(of:with:) 메소드를 활용해 ()을 제거하고 "1,2"를 반환하도록 구현합니다.

    func test소괄호를_제거한_문자열이_반환되는가() {
        //given
        let onetwo = "(1,2)"
        
        //when
        let result = StringControl.removeParentheses(onetwo)
        
        //then
        XCTAssertEqual(result, "1,2")
    }
}
