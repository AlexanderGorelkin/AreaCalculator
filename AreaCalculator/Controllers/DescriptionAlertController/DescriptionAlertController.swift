//
//  DescriptionAlertController.swift
//  AreaCalculator
//
//  Created by Александр Горелкин on 12.02.2024.
//

import UIKit
import ShapeAreaFramework
final class DescriptionAlertController: UIAlertController {
    override var preferredStyle: UIAlertController.Style {
        .alert
    }
    init(circle: CircleShape) {
        super.init(nibName: .none, bundle: .none)
        self.title = "Площадь круга:"
        self.message = circle.formattedAreaString
        self.addAction(createDoneAction())
    }
    init(triangle: TriangleShape) {
        super.init(nibName: .none, bundle: .none)
        self.title = "Площадь треугольника:"
        self.message = triangle.formattedAreaString
        self.addAction(createDoneAction())
    }
    init(error: Error) {
        super.init(nibName: .none, bundle: .none)
        self.title = "Error"
        self.message = error.localizedDescription
        self.addAction(createDoneAction())
    }
    private func createDoneAction() -> UIAlertAction {
        return UIAlertAction(title: "Okey", style: .cancel)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
