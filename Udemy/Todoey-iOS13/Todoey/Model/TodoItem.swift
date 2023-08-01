

class TodoItem: Codable {
    var title: String
    var done: Bool = false
    init(title: String){
        self.title = title
    }
}

