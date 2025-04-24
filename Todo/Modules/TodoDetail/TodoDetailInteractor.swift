//
//  TodoDetailInteractor.swift
//  Todo
//
//  Created by Ruslan Kandratsenka on 22.04.25.
//

import Foundation

class TodoDetailInteractor: TodoDetailInteractorInputProtocol {
    var presenter: TodoDetailInteractorOutputProtocol?
    var todoStore = TodoDataSource.shared
    var todoItem: TodoItem?
    
    func editTodo(title: String, detail: String) {
        guard let todoItem = todoItem else { return }
        todoItem.todo = title
        todoItem.todoDescription = detail
        todoStore.saveTodos()
    }
    
    
}
