//
//  AddToDoViewController.swift
//  ToDoApp
//
//  Created by Edgar Arakelyan on 21.07.22.
//

import UIKit

class AddToDoViewController: UIViewController {
    var stackView: UIStackView!
    var textField: UITextField!
    var textView: UITextView!
    var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initViews()
    }
}

private extension AddToDoViewController {
    func initViews() {
        initStackView()
        initTextField()
        initTextView()
        initSaveButton()
        constructHierarchy()
        activateConstraints()
    }
    
    func initStackView() {
        stackView = UIStackView()
        stackView.spacing = 12
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initTextField() {
        textField = UITextField()
        textField.placeholder = "Name"
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initTextView() {
        textView = UITextView()
        textView.text = "Test"
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 12
        textView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initSaveButton() {
        saveButton = UIButton(type: .system)
        saveButton.setTitle("SAVE", for: .normal)
        saveButton.backgroundColor = .systemBlue
        saveButton.layer.cornerRadius = 12
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func constructHierarchy() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(textView)
        stackView.addArrangedSubview(saveButton)
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),

            textField.heightAnchor.constraint(equalToConstant: 50),
            textView.heightAnchor.constraint(equalToConstant: 130),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
}
