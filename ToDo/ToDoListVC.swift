//
//  ViewController.swift
//  ToDo
//
//  Created by OMAR Mohamuud on 22/03/2021.
//

import UIKit

class ToDoListVC: UITableViewController {
    
    
let itemArray = ["Find Mike", "Buy Milk", "Drive to the store"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
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
        
        print(indexPath.row
        
        
        
        
        )
    }

}

