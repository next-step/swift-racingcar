//
//  InputView.swift
//  RacingCar
//
//  Created by nylah.j on 2022/04/29.
//

import Foundation

struct InputView {
    func input() -> String? {
        print("연산식을 입력하세요.")
        print("(연산자 우선순위에 관계없이 왼쪽에서 오른쪽으로 연산이 진행됩니다.)")
        return readLine()
    }
}
