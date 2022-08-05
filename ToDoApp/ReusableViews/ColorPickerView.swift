//
//  ColorPicker.swift
//  ToDoApp
//
//  Created by Edgar Arakelyan on 24.07.22.
//

import UIKit

struct ColorPickerViewData {
    var color: UIColor
    var isSelected: Bool
}

class ColorPickerView: UIView {
    var button: UIButton!
    var onColorSelection: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initButton()
    }
    
    func set(data: ColorPickerViewData) {
        self.backgroundColor = data.color
        if data.isSelected {
            layer.borderWidth = 4
            layer.borderColor = UIColor.systemBlue.cgColor
        } else {
            layer.borderWidth = 0
        }
    }
    
    @objc func buttonPressed() {
        onColorSelection?()
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = frame.width/2
    }
}

extension ColorPickerView {
    func initButton() {
        button = UIButton()
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        button.addTarget(
            self,
            action: #selector(buttonPressed),
            for: .touchUpInside
        )
    }
}
