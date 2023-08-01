

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray: [TodoItem] = []
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
    }
    
    // MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
        
        itemArray[index].done = !itemArray[index].done
        
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
        
        saveItems()

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
                self.saveItems()
                
//                let index = IndexPath(index: self.itemArray.count - 1)
//                self.tableView.reloadRows(at: [index], with: .automatic)
            }
            
        }
        alert.addTextField() { alertTextField in
            alertTextField.placeholder = "Create new item"
        }
        
        alert.addAction(action)
        present(alert, animated: true)
        
    }
    
    func saveItems() {
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(self.itemArray)
            try data.write(to: self.dataFilePath!)
        } catch {
            print("Error encoding item array, \(error)")
        }
        self.tableView.reloadData()
    }
    
    func loadItems() {
        guard let data = try? Data(contentsOf: dataFilePath!) else { return }
        
        let decoder = PropertyListDecoder()
        
        do {
            let decodedData = try decoder.decode([TodoItem].self, from: data)
            itemArray = decodedData
        } catch {
            print("Error occured: \(error)")
        }
    }
        
}



