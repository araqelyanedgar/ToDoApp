//
//  ViewController.swift
//  ToDoApp
//
//  Created by Edgar Arakelyan on 14.07.22.
//

import UIKit

class AddItemViewController: UIViewController, UITextFieldDelegate {
    var titleTextField: UITextField!
    var infoTextField: UITextField!
    var colorCollection: UICollectionView!
    var saveButton: UIButton!
    var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        commonInit()
        
//        titleTextField.addTarget(self, action: #selector(openKeyboard), for: .touchUpInside)
    }
    
    func commonInit() {
        initTitleLabel()
        initinfoLabel()
//        initColorCollection()
        initSaveButton()
        initStackView()
        constructHierarchy()
    }
    
    @objc func openKeyboard() {
        titleTextField.resignFirstResponder()
    }
}

extension AddItemViewController {
    func initTitleLabel() {
        titleTextField = UITextField()
        titleTextField.placeholder = "Enter text"
        titleTextField.backgroundColor = .secondarySystemBackground
        titleTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initinfoLabel() {
        infoTextField = UITextField()
        infoTextField.backgroundColor = .blue
        infoTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        infoTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initColorCollection() {
        colorCollection = UICollectionView()
        colorCollection.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initSaveButton() {
        saveButton = UIButton()
        saveButton.setTitle("SAVE", for: .normal)
        saveButton.backgroundColor = .systemBlue
        saveButton.layer.cornerRadius = 12
        saveButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        saveButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initStackView() {
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
    }
    
    func constructHierarchy() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(titleTextField)
        stackView.addArrangedSubview(infoTextField)
//        stackView.addArrangedSubview(colorCollection)
        stackView.addArrangedSubview(saveButton)
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
        ])
    }
}
