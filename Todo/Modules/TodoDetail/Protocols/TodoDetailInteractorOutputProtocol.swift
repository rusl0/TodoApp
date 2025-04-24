//
//  TodoDetailInteractorOutputProtocol.swift
//  Todo
//
//  Created by Ruslan Kandratsenka on 22.04.25.
//

import Foundation

protocol TodoDetailInteractorOutputProtocol: AnyObject {
    
    // Interactor -> Presenter
    func didEditTodo(_ todo: TodoItem)
}
