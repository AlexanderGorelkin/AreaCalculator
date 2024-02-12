//
//  CircleViewController.swift
//  AreaCalculator
//
//  Created by Александр Горелкин on 12.02.2024.
//

import UIKit
import ShapeAreaFramework
final class CircleViewController: UIViewController {
    private lazy var raduisTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Введите радиус"
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 20)
        textField.keyboardType = .decimalPad
        return textField
    }()
    private lazy var areaButton = {
        let button = CustomButtonView(title: "Расчитать площадь")
        button.addTarget(self, action: #selector(calculateButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Расчет площади круга"
        view.backgroundColor = .white
        setupSubviews()
    }
    private func setupSubviews() {
        view.addView(raduisTextField)
        view.addView(areaButton)
        NSLayoutConstraint.activate([
            raduisTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            raduisTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            raduisTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            areaButton.topAnchor.constraint(equalTo: raduisTextField.bottomAnchor, constant: 20),
            areaButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            areaButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
    }
}
@objc extension CircleViewController {
    func calculateButtonPressed(_ sender: CustomButtonView) {
        guard let radius = raduisTextField.toDouble else { return }
        do {
            let circle = try CircleShape(radius: radius)
            self.present(DescriptionAlertController(circle: circle), animated: true)
        } catch(let error) {
            self.present(DescriptionAlertController(error: error), animated: true)
        }
    }
}
