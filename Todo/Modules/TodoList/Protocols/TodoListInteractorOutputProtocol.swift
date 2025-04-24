//
//  TodoListInteractorOutputProtocol.swift
//  Todo
//
//  Created by Ruslan Kandratsenka on 22.04.25.
//

import Foundation

protocol TodoListInteractorOutputProtocol: AnyObject {
    // Interactor -> Presenter
    func didAddTodo(_ todo: TodoItem)
    func didRemoveTodo(_ todo: TodoItem)
    func didRetrieveTodos(_ todos: [TodoItem])
    func didUpdateCounter()
    func onError(message: String)
}
