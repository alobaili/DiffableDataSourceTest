//
//  Item.swift
//  DiffableDataSourceTest
//
//  Created by Abdulaziz AlObaili on 03/02/2020.
//  Copyright © 2020 Abdulaziz AlObaili. All rights reserved.
//

import Foundation

struct Item: Hashable {
    
    var id: Int
    var name: String
    
    
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.id == rhs.id
    }
    
    
}
