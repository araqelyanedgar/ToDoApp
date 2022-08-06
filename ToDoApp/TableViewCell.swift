//
//  TableViewCell.swift
//  ToDoApp
//
//  Created by Edgar Arakelyan on 03.08.22.
//

import UIKit

class TableViewCell: UITableViewCell {
    var doneButton: UIButton!
    var titleLabel: UILabel!
    var priority: UIView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
        
        self.backgroundColor = .white
        
        doneButton.addTarget(self,
                             action: #selector(doneTapped),
                             for: .touchUpInside
        )
        contentView.isUserInteractionEnabled = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        initDoneButton()
        initTitleLabel()
        initPriority()
        addViews()
        addConstraints()
    }
    
    @objc func doneTapped() {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 33, weight: .regular, scale: .default)
        let largeBoldDoc = UIImage(systemName: "checkmark.circle.fill", withConfiguration: largeConfig)
        doneButton.setImage(largeBoldDoc, for: .normal)
        print("OK")
    }
}

extension TableViewCell {
    func initDoneButton() {
        doneButton = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 38, weight: .regular, scale: .default)
        let largeBoldDoc = UIImage(systemName: "checkmark.circle", withConfiguration: largeConfig)
        doneButton.setImage(largeBoldDoc, for: .normal)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = "Hello"
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints  = false
    }
    
    func initPriority() {
        priority = UIView()
        priority.backgroundColor = .systemRed
        priority.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addViews() {
        addSubview(doneButton)
        addSubview(titleLabel)
        addSubview(priority)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            doneButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            doneButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            doneButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            titleLabel.leadingAnchor.constraint(equalTo: doneButton.trailingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            priority.trailingAnchor.constraint(equalTo: trailingAnchor),
            priority.widthAnchor.constraint(equalToConstant: 20),
            priority.heightAnchor.constraint(equalTo: heightAnchor)
        ])
    }
}
