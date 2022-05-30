//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class TODOListViewController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var searchbarOutlet: UISearchBar!
    
    var items = [Item]()
    
    var selectedCategory : Category? {
        didSet{
            if let category = selectedCategory {
//                let request: NSFetchRequest<Item> = Item.fetchRequest()
//                request.predicate = NSPredicate(format: "parentCategory.name MATCHES %@", category.name! as String)
//                request.sortDescriptors = [NSSortDescriptor(key: "parentCategory", ascending: true)]
                loadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("TODOListViewController")
        searchbarOutlet.delegate = self
//        loadData()
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
                    let itemA = Item(context: self.context)
                    itemA.title = text
                    itemA.done = false
                    itemA.parentCategory = self.selectedCategory
                    self.items.append(itemA)
                    self.tableView.reloadData()
                    self.saveItem()
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
        
//        context.delete(items[indexPath.row])
//        items.remove(at: indexPath.row)
        
        items[indexPath.row].done = !items[indexPath.row].done
        tableView.cellForRow(at: indexPath)?.accessoryType = items[indexPath.row].done == true ? .checkmark : .none
        saveItem()
        
    }
    
    /*
     MARK: - Data storage
     */
    func saveItem () {
        do{
            try context.save()
        }catch{
            debugPrint("error while saving with error: \(error)")
        }
        self.tableView.reloadData()
    }
    
    // MARK: - Load data from storage
    
    func loadData(with request: NSFetchRequest<Item> = Item.fetchRequest(), predicate additionalPredicate: NSPredicate? = nil){
        
        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name! as String)
        
        if let addpredicate = additionalPredicate {
            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, addpredicate])
        }else{
            request.predicate = categoryPredicate
        }
        
        do{
            items = try context.fetch(request)
        }catch {
            debugPrint("error fetching data with \(error)")
        }
        
        self.tableView.reloadData()
    }

}

extension TODOListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text{
            let request: NSFetchRequest<Item> = Item.fetchRequest()
            request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
            loadData(with: request, predicate: NSPredicate(format: "title CONTAINS[cd] %@", text))
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        if searchText.count == 0 {
            loadData()
            
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}

