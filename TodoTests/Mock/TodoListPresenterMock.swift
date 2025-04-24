//
//  TodoListPresenterMock.swift
//  TodoTests
//
//  Created by Ruslan Kandratsenka on 24.04.25.
//

@testable import Todo

class TodoListPresenterMock: TodoListInteractorOutputProtocol {
    
    var downloadCompleted: (([TodoItem]) -> Void)?
    
    func didAddTodo(_ todo: TodoItem) {
        
    }
    func didRemoveTodo(_ todo: TodoItem) {
        
    }
    func didRetrieveTodos(_ todos: [TodoItem]) {
        self.downloadCompleted?(todos)
    }
    
    func didUpdateCounter() {
        
    }
    
    func onError(message: String) {
        
    }
}
