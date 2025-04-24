//
//  TodoItem+Extension.swift
//  Todo
//
//  Created by Ruslan Kandratsenka on 21.04.25.
//

import Foundation
import CoreData

extension TodoItem {
    static func create(from item:TodoDTO, in context: NSManagedObjectContext) -> TodoItem {
        let newItem = TodoItem(context: context)
        
        newItem.id = item.id
        newItem.todo = item.todo
        newItem.todoDescription = item.todo
        newItem.completed = item.completed
        newItem.userId = item.userId
        newItem.creationDate = Date.now
        
        return newItem
    }
}
