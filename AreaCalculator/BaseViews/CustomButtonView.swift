//
//  CustomButtonView.swift
//  AreaCalculator
//
//  Created by Александр Горелкин on 12.02.2024.
//

import UIKit
final class CustomButtonView: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .beginFromCurrentState], animations: {
                self.transform = self.isHighlighted ? .init(scaleX: 0.9, y: 0.9) : .identity
            }, completion: nil)
        }
    }
    override func tintColorDidChange() {
        super.tintColorDidChange()
        if tintAdjustmentMode == .dimmed {
            self.backgroundColor = .systemGray2
        } else {
            self.setTitleColor(.white, for: .normal)
            self.backgroundColor = .white
        }
    }
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        tintColorDidChange()
        layer.cornerRadius = 8
        layer.cornerCurve = .continuous
        setInsets()
    }
    func setInsets() {
        var config = UIButton.Configuration.filled()
        config.contentInsets = .init(top: 10, leading: 14, bottom: 10, trailing: 14)
        configuration = config
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
