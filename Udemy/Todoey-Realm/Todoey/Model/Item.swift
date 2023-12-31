//
//  Item.swift
//  Todoey
//
//  Created by yun on 2023/08/03.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @Persisted var title: String
    @Persisted var done: Bool = false
    @Persisted var dateCreated: Date = Date()
    @Persisted(originProperty: "items") var parentCategory: LinkingObjects<Category>
    
    convenience init(title: String) {
        self.init()
        self.title = title
    }
}


