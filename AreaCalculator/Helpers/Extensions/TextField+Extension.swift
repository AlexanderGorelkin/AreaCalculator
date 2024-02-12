//
//  TextField+Extension.swift
//  AreaCalculator
//
//  Created by Александр Горелкин on 12.02.2024.
//

import UIKit
extension UITextField {
    var toDouble: Double? {
        return text?.replacingOccurrences(of: ",", with: ".").toDouble
    }
}
