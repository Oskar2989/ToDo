//
//  ViewController.swift
//  ToDo
//
//  Created by OMAR Mohamuud on 22/03/2021.
//

import UIKit

class ToDoListVC: UITableViewController {
    
    
    var itemArray = ["Find Mike", "Buy Milk", "Drive to the store"]
    
    let defualts = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        if let items = defualts.array(forKey:  "ToDoListArray") as? [String] {
        
            itemArray = items
        }
        
        
    }
    
//    Mark- TablView DataSources Method

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    
//    Mark - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
        
        
    }
    
//    Mark- Add New Item
    
    
    @IBAction func addBtnPressed(_ sender: UIBarButtonItem) {
        
        var textfield = UITextField()
        
        let alert = UIAlertController(title: "Add New To Do Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { [self] (action) in
            
            itemArray.append(textfield.text!)
            self.defualts.set(self.itemArray, forKey: "ToDoListArray")
            self.tableView.reloadData()
            
            
        }
        
        alert.addTextField { (alertTextField) in
            
            alertTextField.placeholder = "Create New Item"
            textfield = alertTextField
            
            
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

