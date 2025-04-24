//
//  TodoDetailViewProtocol.swift
//  Todo
//
//  Created by Ruslan Kandratsenka on 22.04.25.
//

import Foundation

protocol TodoDetailViewProtocol: AnyObject {
    var presenter: TodoDetailPresenterProtocol? { get set }
    // Presenter -> View
    func showTodo(_ todo: TodoItem)
}
