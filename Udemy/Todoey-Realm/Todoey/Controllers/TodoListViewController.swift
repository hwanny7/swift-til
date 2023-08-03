

import UIKit
import RealmSwift

class TodoListViewController: UITableViewController {
    
    var todoItems: Results<Item>?
    let realm = try! Realm()
    
    var selectedCategory: Category? {
        didSet {
            loadItems()
        }
    }
    // viewDidLoad에서 진행해도 상관없음. 안젤라는 computed property를 보여주고 싶었던 것 같음
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    // MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        if let item = todoItems?[indexPath.row] {
            cell.textLabel?.text = item.title
            cell.accessoryType = item.done ? .checkmark : .none
        }

        return cell
    }
    
    // MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if let item = todoItems?[indexPath.row] {
            do {
                try realm.write {
                    item.done = !item.done
                }
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            } catch {
                print("Error saving done satus, \(error)")
            }
        }

        tableView.deselectRow(at: indexPath, animated: true)
        // 선택된 셀 백그라운드 복구
    }
    
    // MARK: - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: NSLocalizedString("Add item", comment: "Default acition"), style: .default) { action in
            guard let userTextField = alert.textFields?.first?.text else { return }
            
            if let currentCategory = self.selectedCategory {
                do {
                    let item = Item(title: userTextField)
                    try self.realm.write {
                        self.selectedCategory?.items.append(item)
                    }
                    self.tableView.reloadData()
                } catch {
                    print("Error saving context \(error)")
                }
            }
        }
        alert.addTextField() { alertTextField in
            alertTextField.placeholder = "Create new item"
        }
        
        alert.addAction(action)
        present(alert, animated: true)
        
    }
    
    // MARK: - Load Items
    
    
    func loadItems() {

        todoItems = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
        
        self.tableView.reloadData()
    }
        
}

// MARK: - searchBar methods

//extension TodoListViewController: UISearchBarDelegate {
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        let searchInput = searchBar.text!
//        
//        let request: NSFetchRequest<Item> = Item.fetchRequest()
//        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchInput)
//        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
//        
//        loadItems(with: request, predicate: predicate)
//    }
//    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        // 한 번 검색을 한 뒤에 변경되는 경우를 감지한다.
//        
//        if searchBar.text?.count == 0 {
//            loadItems()
//            
//            DispatchQueue.main.async {
//                searchBar.resignFirstResponder()
//            }
//            // x 버튼 눌렀을 때도 키보드가 사라지게 하기 위함
//        }
//    }
//}

