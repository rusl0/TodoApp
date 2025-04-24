//
//  TodoDetailRouter.swift
//  Todo
//
//  Created by Ruslan Kandratsenka on 22.04.25.
//

import UIKit

class TodoDetailRouter: TodoDetailRouterProtocol {
    func navigateBackToListViewController(from view: TodoDetailViewProtocol) {
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid view protocol type")
        }
        viewVC.navigationController?.popViewController(animated: true)
    }
    
    
    static var storyboard: UIStoryboard {
           return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createTodoDetailRouterModule(with todo: TodoItem) -> UIViewController {
        guard let detailVC = storyboard.instantiateViewController(withIdentifier: "TodoDetailViewController") as? TodoDetailViewController else {
            fatalError("Invalid type")
        }
        
        let presenter = TodoDetailPresenter()
        detailVC.presenter = presenter
        presenter.view = detailVC
        let interactor = TodoDetailInteractor()
        interactor.todoItem = todo
        interactor.presenter = presenter
        presenter.interactor = interactor
        let router = TodoDetailRouter()
        presenter.router = router
        
        return detailVC
    }
}
