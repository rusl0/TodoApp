//
//  TodoDataSource.swift
//  Todo
//
//  Created by Ruslan Kandratsenka on 22.04.25.
//

import Foundation
import CoreData

class TodoDataSource {
    private init() {}
    public static let shared = TodoDataSource()
    public var persistent: PersistentController = PersistentController.shared
    
    public private(set) var todos: [TodoItem] = []
    
    func loadData() {
        do {
            todos = try persistent.viewContext.fetch(TodoItem.fetchRequest())
        } catch {
            todos = []
        }
    }
    
    func saveTodos() {
        if persistent.viewContext.hasChanges {
            persistent.saveContext()
        }
    }
    
    func removeTodo(_ todo: TodoItem) {
        persistent.viewContext.delete(todo)
    }
    
    func addTodos(from todos: [TodoDTO]) {
        let _ = todos.map { TodoItem.create(from: $0, in: persistent.viewContext) }
        persistent.saveContext()
    }
}
