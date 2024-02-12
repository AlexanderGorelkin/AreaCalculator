//
//  String+Extension.swift
//  AreaCalculator
//
//  Created by Александр Горелкин on 12.02.2024.
//

import Foundation
extension String {
    var toDouble: Double {
        return Double(self) ?? 0
    }
}
