//
//  StubRacingCarViewModel.swift
//  RacingCarTest
//
//  Created by 남기범 on 2021/11/05.
//

import Foundation
import TestHelper

class StubRacingCarViewModel: StubContainer {
    func startRacing() {
        self.verify(name: "isForward", arg: true)
    }
}
