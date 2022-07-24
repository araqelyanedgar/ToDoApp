//
//  ViewController.swift
//  ToDoApp
//
//  Created by Edgar Arakelyan on 14.07.22.
//

import UIKit

class ViewController: UIViewController {
    var addButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        initAddButton()
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    @objc func addButtonTapped() {
        let viewController = AddToDoViewController()
        if #available(iOS 15.0, *) {
//            if let sheet = viewController.sheetPresentationController {
//                sheet.detents = [.medium()]
//            }
        } else {
            // Fallback on earlier versions
        }
        navigationController?.present(viewController, animated: true)
    }
    
    func initAddButton() {
        addButton = UIButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addButton)
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 130, weight: .regular, scale: .default)
        let largeBoldDoc = UIImage(systemName: "plus.circle.fill", withConfiguration: largeConfig)
        addButton.setImage(largeBoldDoc, for: .normal)
        
        NSLayoutConstraint.activate([
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }
}
