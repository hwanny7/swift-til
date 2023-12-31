
import UIKit
import CoreData
import RealmSwift

class CategoryViewController: SwipeTableViewController {

    let realm = try! Realm()

    var categoryArray: Results<Category>?


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80.0
        loadCategories()
    }

    // MARK: - Add New Categories

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)

        let action = UIAlertAction(title: NSLocalizedString("Add Category", comment: "Default acition"), style: .default) { action in
            guard let userTextField = alert.textFields?.first?.text else { return }

            let category = Category(name: userTextField)

            if !userTextField.isEmpty {
                self.save(category: category)
                let indexPathOfNewItem = IndexPath(row: self.categoryArray!.count - 1, section: 0)
                // 빈 리스트에 추가를 하면 save 메소드를 통해 Array에 category가 바로 삽입되기 때문에 문제가 없다.
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
        return categoryArray?.count ?? 0
        // func의 반환 값이 Int이기 때문에 ?? operator를 사용해준다.
    }
    
    
    // MARK: - Swipe Cell Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        cell.textLabel?.text = categoryArray?[indexPath.row].name
        return cell
    }
    


    // MARK: - TableView Delegate Methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController

        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        destinationVC.selectedCategory = categoryArray?[indexPath.row]
    }



    // MARK: - Data Manipulation Methods
    func save(category: Category) {
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving context \(error)")
        }
    }

    func loadCategories() {
        categoryArray = realm.objects(Category.self)
        self.tableView.reloadData()
    }
    
    // MARK: - Delete Data From Swipe
    override func updateModel(at indexPath: IndexPath) {
        if let categoryForDeletion = self.categoryArray?[indexPath.row] {
            do {
                try self.realm.write {
                    self.realm.delete(categoryForDeletion)
                }
            } catch {
                print("Error delete category \(error)")
            }
        }
    }
}

