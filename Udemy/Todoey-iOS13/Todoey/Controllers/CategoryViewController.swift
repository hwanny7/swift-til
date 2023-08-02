
import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categoryArray: [Category] = []
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Add New Categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: NSLocalizedString("Add Category", comment: "Default acition"), style: .default) { action in
            guard let userTextField = alert.textFields?.first?.text else { return }
            
            let category = Category(context: self.context)
            category.name = userTextField
            
            if !userTextField.isEmpty {
                self.categoryArray.append(category)
                self.saveItems()
                
                let indexPathOfNewItem = IndexPath(row: self.itemArray.count - 1, section: 0)
                self.tableView.insertRows(at: [indexPathOfNewItem], with: .none)
            }
            
        }
        
        
        alert.addTextField() { alertTextField in
            alertTextField.placeholder = "Create new category"
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    

    // MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let category = categoryArray[indexPath.row]
        cell.textLabel?.text = category.name

        return cell
    }
    
    
    // MARK: - TableView Delegate Methods
    
    // MARK: - Data Manipulation Methods
    

}
