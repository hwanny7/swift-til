

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray: [TodoItem] = []
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let first = TodoItem(title: "hello")
        let second = TodoItem(title: "bye")
        
        itemArray.append(first)
        itemArray.append(second)
        
        if let items = defaults.array(forKey: "newArray") as? [TodoItem] {
            itemArray = items
        }
    }
    
    // MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none

        return cell
    }
    
    // MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let index:Int = indexPath.row
        
        if itemArray[index].done == false {
            itemArray[index].done = true
        } else {
            itemArray[index].done = false
        }
        
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
        
//        self.defaults.set(self.itemArray, forKey: "newArray")

        tableView.deselectRow(at: indexPath, animated: true)
        // 선택된 셀 백그라운드 복구
    }
    
    // MARK: - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: NSLocalizedString("Add item", comment: "Default acition"), style: .default) { action in
            guard let userTextField = alert.textFields?.first?.text else { return }
            
            let item = TodoItem(title: userTextField)
            
            if !userTextField.isEmpty {
                self.itemArray.append(item)
                self.defaults.set(self.itemArray, forKey: "newArray")
                
                let index = IndexPath(index: self.itemArray.count - 1)
                self.tableView.reloadRows(at: [index], with: .automatic)
            }
            
        }
        alert.addTextField() { alertTextField in
            alertTextField.placeholder = "Create new item"
        }
        
        alert.addAction(action)
        present(alert, animated: true)
        
    }
    
    
        
}



