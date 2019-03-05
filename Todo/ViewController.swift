//
//  ViewController.swift
//  Todo
//
//  Created by Maggie on 2019-03-04.
//  Copyright © 2019 MidTerm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var todos = [Task]()

    @IBOutlet weak var tableView: UITableView!
    
    var selectedTodo: String!
    var selectedTodoDesc: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        todos = initialTodos()
    }
    
    func initialTodos() -> [Task] {
        if let todos = UserDefaults.standard.value(forKey: "tasks") as? Data {
            let decoder = JSONDecoder()
            if let objectsDecoded = try? decoder.decode(Array.self, from: todos) as [Task] {
                return objectsDecoded
            } else {
                return Task.getMockData()
            }
        } else {
            return Task.getMockData()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        didTapAddItemButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "todo_detail_segue" {
            let dvc = segue.destination as! TodoDetailViewController
            dvc.todoTitle = selectedTodo
            dvc.todoDesc = selectedTodoDesc
        }
    }
    
    @objc func didTapAddItemButton() {
        // Create an alert
        let alert = UIAlertController(
            title: "Add a Todo",
            message: "Add a name with a description",
            preferredStyle: .alert)
        
        // Add a text field to the alert for the new item's title
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            if let title = alert.textFields?[0].text, let desc = alert.textFields?[1].text {
                self.addNewToDoItem(title: title, desc: desc)
            }
        }))
        
        // Present the alert to the user
        self.present(alert, animated: true, completion: nil)
    }
    
    private func addNewToDoItem(title: String, desc: String) {
        todos.append(Task(title: title, desc: desc))
        print(todos)
        saveTodos(todos: todos)
        
        tableView.reloadData()
    }
    
    func saveTodos(todos: [Task]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(todos) {
            UserDefaults.standard.set(encoded, forKey: "tasks")
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as? TodoTableViewCell, indexPath.row < todos.count {
            let todo = todos[indexPath.row]
            cell.todoTitleLabel.text = todo.title
            cell.todoDescLabel.text = todo.desc
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTodo = todos[indexPath.row].title
        selectedTodoDesc = todos[indexPath.row].desc
        
        performSegue(withIdentifier: "todo_detail_segue", sender: self)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if indexPath.row < todos.count
        {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top)
            saveTodos(todos: todos)
        }
    }
}
