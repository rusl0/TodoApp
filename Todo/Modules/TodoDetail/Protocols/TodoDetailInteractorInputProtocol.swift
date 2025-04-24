//
//  TodoDetailInteractorInputProtocol.swift
//  Todo
//
//  Created by Ruslan Kandratsenka on 22.04.25.
//

import Foundation

protocol TodoDetailInteractorInputProtocol: AnyObject {
    
    var presenter: TodoDetailInteractorOutputProtocol? { get set }
    var todoItem: TodoItem? { get set }
    
    // PRESENTER -> INTERACTOR
    func editTodo(title: String, detail: String)
}
