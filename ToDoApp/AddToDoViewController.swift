//
//  AddToDoViewController.swift
//  ToDoApp
//
//  Created by Edgar Arakelyan on 21.07.22.
//

import UIKit

struct ColorsData {
    var id: Int
    var color: UIColor
    
    static var colors: [ColorsData] = [
        ColorsData(id: 0, color: .red),
        ColorsData(id: 1, color: .blue),
        ColorsData(id: 2, color: .brown),
        ColorsData(id: 3, color: .cyan),
        ColorsData(id: 4, color: .yellow),
        ColorsData(id: 5, color: .black),
        ColorsData(id: 6, color: .green),
        ColorsData(id: 7, color: .magenta),
    ]
}

class AddToDoViewController: UIViewController {
    var stackView: UIStackView!
    var textField: UITextField!
    var textView: UITextView!
    var colorView: ColorPickerView!
    var saveButton: UIButton!
    var colorStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initViews()
        createColorViews(with: 0)
        
//        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
//
//    @objc func saveButtonTapped() {
//        saveData(data: )
//    }
    
    func saveData(data: ToDoItem) {
        textField.text = data.title
    }
        
    func createColorViews(with selectedId: Int) {
        // Due to `createColorViews` could called several times, need to `remove` and `add` appropriate subviews to stack view.
        colorStackView.arrangedSubviews.forEach({ $0.removeFromSuperview() })
        for item in ColorsData.colors {
            // MARK: - Instanciating ColorPickerView
            let colorView = ColorPickerView()
//            if item.id == selectedId {
//                colorView.heightAnchor.constraint(equalToConstant: 50).isActive = true
//            } else {
//                colorView.heightAnchor.constraint(equalToConstant: 40).isActive = true
//            }
            
            
            // MARK: - Setting Data to ColorPickerView
            colorView.set(
                data: ColorPickerViewData(
                    color: item.color,
                    isSelected: selectedId == item.id
                )
            )
            // Using `[weak self]` capture list to avoid retain cycle
            colorView.onColorSelection = { [weak self] in
                self?.createColorViews(with: item.id)
            }
            colorStackView.addArrangedSubview(colorView)
        }
    }
}

private extension AddToDoViewController {
    func initViews() {
        initStackView()
        initTextField()
        initTextView()
        initSaveButton()
        initColorStackView()
        constructHierarchy()
        activateConstraints()
    }
    
    func initStackView() {
        stackView = UIStackView()
        stackView.spacing = 22
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initTextField() {
        textField = UITextField()
        textField.placeholder = "Name"
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 12
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initTextView() {
        textView = UITextView()
        textView.text = "Test"
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 12
        textView.backgroundColor = .white
        textView.textColor = .black
        textView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initColorPicker() {
        colorView = ColorPickerView()
        colorView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initSaveButton() {
        saveButton = UIButton(type: .system)
        saveButton.setTitle("SAVE", for: .normal)
        saveButton.backgroundColor = .systemBlue
        saveButton.layer.cornerRadius = 12
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initColorStackView() {
        colorStackView = UIStackView()
        colorStackView.axis = .horizontal
        colorStackView.spacing = 12
        colorStackView.distribution = .fillEqually
        colorStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func constructHierarchy() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(textView)
        stackView.addArrangedSubview(colorStackView)
        stackView.addArrangedSubview(saveButton)
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),

            textField.heightAnchor.constraint(equalToConstant: 50),
            textView.heightAnchor.constraint(equalToConstant: 130),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
}
