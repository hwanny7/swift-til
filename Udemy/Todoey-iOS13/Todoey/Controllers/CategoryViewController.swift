
import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var CategoryArray: [Category] = []
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Add New Categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    

    // MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CategoryArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let category = CategoryArray[indexPath.row]
        cell.textLabel?.text = category.name

        return cell
    }
    
    
    // MARK: - TableView Delegate Methods
    
    // MARK: - Data Manipulation Methods
    

}
