//
//  TodoDetailRouterProtocol.swift
//  Todo
//
//  Created by Ruslan Kandratsenka on 22.04.25.
//

import UIKit

protocol TodoDetailRouterProtocol: AnyObject {
    
    static func createTodoDetailRouterModule(with todo: TodoItem) -> UIViewController
    
    func navigateBackToListViewController(from view: TodoDetailViewProtocol)
    
}
