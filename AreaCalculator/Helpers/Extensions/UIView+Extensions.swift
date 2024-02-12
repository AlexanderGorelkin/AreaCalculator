//
//  UIView+Extensions.swift
//  AreaCalculator
//
//  Created by Александр Горелкин on 12.02.2024.
//

import UIKit
extension UIView {
    func addView(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
