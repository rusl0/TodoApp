//
//  Protocols.swift
//  Todo
//
//  Created by Ruslan Kandratsenka on 22.04.25.
//

import Foundation

protocol TodoListViewProtocol: AnyObject {
    var presenter: TodoListPresenterProtocol? { get set }
    
    // Presenter -> View
    func showTodos(_ todos: [TodoItem])
    func removeTodo(_ todo: TodoItem)
    func updateCounter()
    func showErrorMessage(_ message: String)
}




