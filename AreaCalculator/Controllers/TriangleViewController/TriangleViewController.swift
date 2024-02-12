//
//  TriangleViewController.swift
//  AreaCalculator
//
//  Created by Александр Горелкин on 12.02.2024.
//

import UIKit
import ShapeAreaFramework
final class TriangleViewController: UIViewController {
    
    private lazy var sideATextField = createTextField(with: "A")
    private lazy var sideBTextField = createTextField(with: "B")
    private lazy var sideCTextField = createTextField(with: "C")
    private lazy var areaButton = {
        let button = CustomButtonView(title: "Расчитать площадь")
        button.addTarget(self, action: #selector(calculateButtonPressed), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Расчет площади треугольника"
        view.backgroundColor = .white
        setupSubviews()
    }
    
    private func setupSubviews() {
        view.addView(sideATextField)
        view.addView(sideBTextField)
        view.addView(sideCTextField)
        view.addView(areaButton)
        NSLayoutConstraint.activate([
            sideATextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            sideATextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            sideATextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            sideBTextField.topAnchor.constraint(equalTo: sideATextField.bottomAnchor, constant: 20),
            sideBTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            sideBTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            sideCTextField.topAnchor.constraint(equalTo: sideBTextField.bottomAnchor, constant: 20),
            sideCTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            sideCTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            areaButton.topAnchor.constraint(equalTo: sideCTextField.bottomAnchor, constant: 20),
            areaButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            areaButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
    }
    private func createTextField(with sideName: String) -> UITextField {
        let textField = UITextField()
         textField.placeholder = "Сторона \(sideName)"
         textField.borderStyle = .roundedRect
         textField.font = .systemFont(ofSize: 20)
         textField.keyboardType = .decimalPad
        return textField
    }
   
}
@objc extension TriangleViewController {
    func calculateButtonPressed(_ sender: CustomButtonView) {
        guard let sideA = sideATextField.toDouble else { return }
        guard let sideB = sideBTextField.toDouble else { return }
        guard let sideC = sideCTextField.toDouble else { return }
        do {
            let triangle = try TriangleShape(sideA: sideA, sideB: sideB, sideC: sideC)
            self.present(DescriptionAlertController(triangle: triangle), animated: true)
        } catch(let error) {
            self.present(DescriptionAlertController(error: error), animated: true)
        }
    }
}
