//
//  Array+Extension.swift
//  RacingCar
//
//  Created by Mephrine on 2021/11/01.
//

import Foundation

extension Array where Element == String {
	func isNotEmpty() -> Bool {
		self.count > 0 && !(self.first?.isEmpty ?? true)
	}
}
