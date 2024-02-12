//
//  MainControllers.swift
//  AreaCalculator
//
//  Created by Александр Горелкин on 12.02.2024.
//

import UIKit
final class MainViewController: UIViewController {
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
    }
    private func setupSubviews() {
        view.addView(mainStackView)
        mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        fillStackView()
    }
    private func fillStackView() {
        ShapeTypes.shapes.forEach { shape in
            let button = CustomButtonView(title: shape.rawValue)
            button.addAction(UIAction(handler: { [weak self] _ in
                self?.navigationController?.pushViewController(shape.description, animated: true)
            }), for: .touchUpInside)
            mainStackView.addArrangedSubview(button)
        }
    }
}
extension MainViewController {
    private enum ShapeTypes: String {
        case triangle = "Площадь треугольника"
        case circle = "Площадь круга"
        static let shapes = [triangle, circle]
        var description: UIViewController {
            switch self {
            case .triangle:
                TriangleViewController()
            case .circle:
                CircleViewController()
            }
        }
    }
}
