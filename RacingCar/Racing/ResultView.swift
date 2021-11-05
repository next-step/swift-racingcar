//
//  ResultView.swift
//  RacingCar
//
//  Created by Mephrine on 2021/11/05.
//

import Foundation

protocol Outputable {
	func broadcast(position: Int) -> String
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
	func broadcast(position: Int) -> String {
		let displayingSymbolText = changePositionToSymbolText(position: position)
		printResultPosition(as: displayingSymbolText)
		return displayingSymbolText
	}
	
	private func printResultPosition(as symbolText: String) {
		print(symbolText)
	}
}
