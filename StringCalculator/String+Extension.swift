//
//  String+Extension.swift
//  StringCalculator
//
//  Created by 남기범 on 2021/11/01.
//

import Foundation

extension String {
    var isNotEmpty: Bool {
        return !self.filter({ !$0.isNewline && !$0.isWhitespace }).isEmpty
    }
}
