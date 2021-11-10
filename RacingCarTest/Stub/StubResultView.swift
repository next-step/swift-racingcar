//
//  StubResultView.swift
//  RacingCarTest
//
//  Created by Mephrine on 2021/11/06.
//

import Foundation

final class StubResultView: Outputable {
	var occurredError: InputError? = nil
	func broadcast(position: Int, of name: String) -> String {
		changePositionToSymbolText(position: position)
	}
	
	func broadcast(asError inputError: InputError) {
		self.occurredError = inputError
	}
	
	func startedBroadcasting() {
	}
	
	func broadcastThatCarsHasPassedTrack() {
	}
	
	func broadcastToAward(for winners: [String]) {
	}
}
