//
//  ResultView.swift
//  RacingCar
//
//  Created by Mephrine on 2021/11/05.
//

import Foundation

protocol Outputable {
	func startedBroadcasting()
	func broadcast(asPosition position: Int) -> String
	func broadcast(asError error: InputError)
	func broadcastThatCarsHasPassedTrack()
}

extension Outputable {
	func changePositionToSymbolText(position: Int) -> String {
		var displayingSymbolText = ""
		for _ in 0 ..< position {
			displayingSymbolText.append(RacingOption.outputSymbol)
		}
		return displayingSymbolText
	}
}

struct ResultView: Outputable {
	func startedBroadcasting() {
		print("\n실행 결과")
	}
	
	func broadcast(asPosition position: Int) -> String {
		let displayingSymbolText = changePositionToSymbolText(position: position)
		printResultPosition(as: displayingSymbolText)
		return displayingSymbolText
	}
	
	func broadcastThatCarsHasPassedTrack() {
		print("")
	}
	
	func broadcast(asError inputError: InputError) {
		switch inputError {
		case .invalid(let message):
			print(message)
		}
	}
	
	private func printResultPosition(as symbolText: String) {
		print(symbolText)
	}
}
