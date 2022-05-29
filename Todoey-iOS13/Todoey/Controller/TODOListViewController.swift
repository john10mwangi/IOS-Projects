//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TODOListViewController: UITableViewController {
    
//    var itemArray = K.todoList
    var items = [TodoItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var item1 = TodoItem()
        item1.title = "Swimming"
        var item2 = TodoItem()
        item2.title = "Jogging"
        var item3 = TodoItem()
        item3.title = "Rapping"
        var item4 = TodoItem()
        item4.title = "Singing"
        items.append(item1)
        items.append(item2)
        items.append(item3)
        items.append(item4)
        items.append(item1)
        items.append(item2)
        items.append(item3)
        items.append(item4)
        items.append(item1)
        items.append(item2)
        items.append(item3)
        items.append(item4)
        items.append(item1)
        items.append(item2)
        items.append(item3)
        items.append(item4)
        items.append(item1)
        items.append(item2)
        items.append(item3)
        items.append(item4)
        items.append(item1)
        items.append(item2)
        items.append(item3)
        items.append(item4)
        items.append(item1)
        items.append(item2)
        items.append(item3)
        items.append(item4)
        items.append(item1)
        items.append(item2)
        items.append(item3)
        items.append(item4)
        items.append(item1)
        items.append(item2)
        items.append(item3)
        items.append(item4)
        items.append(item1)
        items.append(item2)
        items.append(item3)
        items.append(item4)
        print("TODOListViewController")
    }
    
    @IBAction func addActionButton(_ sender: Any) {
        var textFieldGlob: UITextField?
        let alertController = UIAlertController(title: "Add item to List", message: "", preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textFieldGlob = textField
            textField.placeholder = "Item to add"
        }
        
        let action = UIAlertAction(title: "Add item", style: .default) { action in
            print("item to be added to todo list")
            if let textField = textFieldGlob {
                if let text = textField.text{
                    var itemA = TodoItem()
                    itemA.title = text
                    self.items.append(itemA)
                    self.tableView.reloadData()
                }
            }
        }
        
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifiers.todoListCellID, for: indexPath)
        cell.textLabel?.text = items[indexPath.row].title
        cell.accessoryType = items[indexPath.row].done ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    /*
     MARK: - Selection
     */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        items[indexPath.row].done = !items[indexPath.row].done
        tableView.cellForRow(at: indexPath)?.accessoryType = items[indexPath.row].done == true ? .checkmark : .none
        
        
    }

}

