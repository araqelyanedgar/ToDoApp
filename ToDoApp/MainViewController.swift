//
//  ViewController.swift
//  ToDoApp
//
//  Created by Edgar Arakelyan on 14.07.22.
//

import UIKit

protocol MainViewControllerDelegate: AnyObject {
    func updateData()
}

struct ToDoItem {
    var isDone: Bool
    var title: String
    var priority: UIColor
    
    static var toDoItemsData = [
        ToDoItem(isDone: true, title: "Todo that", priority: .systemBlue),
        ToDoItem(isDone: true, title: "Wow", priority: .green),
        ToDoItem(isDone: true, title: "sd that", priority: .yellow),
    ]
}

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var addButton: UIButton!
    var tableView: UITableView!
    var toDoItems = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
                navigationItem.title = "To Do List"
                navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addButtonTapped))
        
        initAddButton()
        initTableView()
        addViews()
        addConstraints()
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        
        if ToDoItem.toDoItemsData.isEmpty {
            addButton.isHidden = false
            tableView.isHidden = true
            navigationItem.title = ""
        } else {
            //            addButton.isHidden = true
            //            tableView.isHidden = false
        }
        
        tableView.backgroundColor = .white
        
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }
    
    @objc func addButtonTapped() {
        let viewController = AddToDoViewController()
        viewController.delegate = self
        navigationController?.present(viewController, animated: true)
    }
}

extension MainViewController {
    func initAddButton() {
        addButton = UIButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 130, weight: .regular, scale: .default)
        let largeBoldDoc = UIImage(systemName: "plus.circle.fill", withConfiguration: largeConfig)
        addButton.setImage(largeBoldDoc, for: .normal)
    }
    
    func initTableView() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addViews() {
        view.addSubview(addButton)
        view.addSubview(tableView)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToDoItem.toDoItemsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = ToDoItem.toDoItemsData[indexPath.row]
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "TableViewCell",
            for: indexPath
        ) as! TableViewCell
        
        cell.titleLabel.text = data.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Change the selected background view of the cell.
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ToDoItem.toDoItemsData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
}

extension MainViewController: MainViewControllerDelegate {
    func updateData() {
        tableView.reloadData()
    }
}
