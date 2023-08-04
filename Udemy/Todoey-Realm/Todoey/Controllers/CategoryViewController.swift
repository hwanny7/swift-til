
import UIKit
import CoreData
import RealmSwift
import SwipeCellKit

class CategoryViewController: UITableViewController {

    let realm = try! Realm()

    var categoryArray: Results<Category>?


    override func viewDidLoad() {
        super.viewDidLoad()
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
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! SwipeTableViewCell
        cell.delegate = self
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
}

// MARK: - Swipe Cell Delegate Methods

extension CategoryViewController: SwipeTableViewCellDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeCellKit.SwipeActionsOrientation) -> [SwipeCellKit.SwipeAction]? {
        
        guard orientation == .right else { return nil }

        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            // handle action by updating model with deletion
        }

        // customize the action appearance
        deleteAction.image = UIImage(named: "delete")

        return [deleteAction]
    }
    
    
}
