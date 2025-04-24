//
//  TodoListInteractorInputProtocol.swift
//  Todo
//
//  Created by Ruslan Kandratsenka on 22.04.25.
//

import Foundation

protocol TodoListInteractorInputProtocol: AnyObject {
    var presenter: TodoListInteractorOutputProtocol? { get set }
    
    // Presenter -> Interactor
    func retrieveTodos()
    func saveTodo(_ todo: TodoItem)
    func deleteTodo(_ todo: TodoItem)
    func fetchTodos()
    func updateCounter()
}
