//
//  TodoListRouter.swift
//  Todo
//
//  Created by Ruslan Kandratsenka on 22.04.25.
//

import UIKit

class TodoListRouter: TodoListRouterProtocol {
    func presentShare(from view: TodoListViewProtocol, for todo: TodoItem) {
        
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid type")
        }
        
        let textToShare = ["\(todo.todo ?? "")\n\(todo.todoDescription ?? "")"]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = viewVC.view
        viewVC.present(activityViewController, animated: true, completion: nil)
    }
    
    func presentToDoDetailScreen(from view: TodoListViewProtocol, for todo: TodoItem) {
        let detailVC = TodoDetailRouter.createTodoDetailRouterModule(with: todo)
        
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid type")
        }
        
        viewVC.navigationController?.pushViewController(detailVC, animated: true)
    }
}
