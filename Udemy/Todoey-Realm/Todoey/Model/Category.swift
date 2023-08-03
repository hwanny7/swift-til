//
//  Category.swift
//  Todoey
//
//  Created by yun on 2023/08/03.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @Persisted var name: String
    let items = List<Item>()
    
    convenience init(name: String){
        self.init()
        self.name = name
    }
    
}


