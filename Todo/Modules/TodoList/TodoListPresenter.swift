//
//  TodoListPresenter.swift
//  Todo
//
//  Created by Ruslan Kandratsenka on 22.04.25.
//

import UIKit

class TodoListPresenter: TodoListPresenterProtocol {
    
    weak var view: TodoListViewProtocol?
    var interactor: TodoListInteractorInputProtocol?
    var router: TodoListRouterProtocol?
    
    func viewWillAppear() {
        interactor?.retrieveTodos()
    }
    
    func showTodoDetail(_ todo: TodoItem) {
        guard let view = view else { return }
        router?.presentToDoDetailScreen(from: view, for: todo)
    }
    
    func showShare(_ todo: TodoItem) {
        guard let view = view else { return }
        router?.presentShare(from: view, for: todo)
    }
    
    func addTodo(_ todo: TodoItem) {
        interactor?.saveTodo(todo)
    }
    
    func removeTodo(_ todo: TodoItem) {
        interactor?.deleteTodo(todo)
    }
    
    func reloadTodo() {
        interactor?.retrieveTodos()
    }
    
    func completeTodo(_ todo: TodoItem) {
        interactor?.saveTodo(todo)
    }
    
    func fetchTodo() {
        interactor?.fetchTodos()
    }
    
    func updateCounter() {
        interactor?.updateCounter()
    }
}

extension TodoListPresenter: TodoListInteractorOutputProtocol {
    
    func didAddTodo(_ todo: TodoItem) {
        
    }
    
    func didRetrieveTodos(_ todos: [TodoItem]) {
        view?.showTodos(todos)
        view?.updateCounter()
    }
    
    func didRemoveTodo(_ todo: TodoItem) {
        view?.removeTodo(todo)
        view?.updateCounter()
    }
    
    func onError(message: String) {
        view?.showErrorMessage(message)
    }
    
    func didUpdateCounter() {
        view?.updateCounter()
    }
}
