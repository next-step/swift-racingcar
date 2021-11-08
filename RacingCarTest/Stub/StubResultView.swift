//
//  StubResultView.swift
//  RacingCarTest
//
//  Created by Mephrine on 2021/11/06.
//

import Foundation

final class StubResultView: Outputable {
	var occcurredError: InputError? = nil
	func broadcast(position: Int, of name: String) -> String {
		changePositionToSymbolText(position: position)
	}
	
	func broadcast(asError inputError: InputError) {
		self.occcurredError = inputError
	}
	
	func startedBroadcasting() {
	}
	
	func broadcastThatCarsHasPassedTrack() {
	}
	
	func broadcastToAward(for winners: [String]) {
	}
}
