//
//  TodoDetailPresenter.swift
//  Todo
//
//  Created by Ruslan Kandratsenka on 22.04.25.
//

import Foundation

class TodoDetailPresenter: TodoDetailPresenterProtocol {
    var router: TodoDetailRouterProtocol?
    var view: TodoDetailViewProtocol?
    var interactor: TodoDetailInteractorInputProtocol?
    
    func viewDidLoad() {
        if let todoItem = interactor?.todoItem {
            view?.showTodo(todoItem)
        }
    }
    
    func editTodo(title: String, detail: String) {
        interactor?.editTodo(title: title, detail: detail)
    }
}

extension TodoDetailPresenter: TodoDetailInteractorOutputProtocol {
    func didEditTodo(_ todo: TodoItem) {
        view?.showTodo(todo)
    }
    
    
}
