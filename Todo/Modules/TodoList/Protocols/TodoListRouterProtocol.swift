//
//  TodoListRouterProtocol.swift
//  Todo
//
//  Created by Ruslan Kandratsenka on 22.04.25.
//

import Foundation

protocol TodoListRouterProtocol: AnyObject {
    func presentToDoDetailScreen(from view: TodoListViewProtocol, for todo: TodoItem)
    func presentShare(from view:TodoListViewProtocol, for todo: TodoItem)
}
