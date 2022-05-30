//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by 8teq Dev on 5/29/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class CategoryTableViewController: UITableViewController {
    
    var categories = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifiers.categoryCellID, for: indexPath)
        cell.textLabel?.text = categories[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: K.seguesIDs.categoriesToItemsId, sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    @IBAction func categoriesButtonAction(_ sender: UIBarButtonItem) {
        var alertTextField : UITextField?
        
        let alert = UIAlertController(title: "Add Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add category", style: .default) { action in
            if let text = alertTextField?.text{
                let category = Category(context: self.context)
                category.name = text
                self.categories.append(category)
                self.saveData()
            }
        }
        
        alert.addTextField { textField in
            alertTextField = textField
        }
        alert.addAction(action)
        
        present(alert, animated: true)
    }
    
    func saveData() {
        do{
            try context.save()
        }catch{
            debugPrint("error occured during saving with : \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func loadData(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
        do{
            categories = try context.fetch(request)
        }catch{
            print("error fetching data with : \(error)")
        }
        
        self.tableView.reloadData()
        
    }
    
    
    /*
    // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TODOListViewController
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories[selectedIndexPath.row]
        }
    }

}
