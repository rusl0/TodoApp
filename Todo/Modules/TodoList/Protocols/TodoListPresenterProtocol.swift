//
//  TodoListPresenterProtocol.swift
//  Todo
//
//  Created by Ruslan Kandratsenka on 22.04.25.
//

import Foundation

protocol TodoListPresenterProtocol: AnyObject {
    
    var view: TodoListViewProtocol? { get set }
    var interactor: TodoListInteractorInputProtocol? { get set }
    var router: TodoListRouterProtocol? { get set }
    
    func viewWillAppear()
    func showTodoDetail(_ todo: TodoItem)
    func showShare(_ todo: TodoItem)
    func addTodo(_ todo: TodoItem)
    func removeTodo(_ todo: TodoItem)
    func reloadTodo()
    func completeTodo(_ todo: TodoItem)
    func fetchTodo()
    func updateCounter()
}
