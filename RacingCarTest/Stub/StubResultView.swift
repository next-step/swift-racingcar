//
//  StubResultView.swift
//  RacingCarTest
//
//  Created by Mephrine on 2021/11/06.
//

import Foundation

struct StubResultView: Outputable {
	func broadcast(position: Int) -> String {
		changePositionToSymbolText(position: position)
	}
}
