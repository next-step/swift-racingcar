//
//  StubResultView.swift
//  RacingCarTest
//
//  Created by Mephrine on 2021/11/06.
//

import Foundation

final class StubResultView: Outputable {
	var occcurredError: InputError? = nil
	func broadcast(asPosition position: Int) -> String {
		changePositionToSymbolText(position: position)
	}
	
	func startedBroadcasting() {
	}
	
	func broadcastThatCarsHasPassedTrack() {
	}
	
	func broadcast(asError inputError: InputError) {
		self.occcurredError = inputError
	}
}
