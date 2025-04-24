//
//  TodoDetailPresenterProtocol.swift
//  Todo
//
//  Created by Ruslan Kandratsenka on 22.04.25.
//

import Foundation

protocol TodoDetailPresenterProtocol: AnyObject {
    var view: TodoDetailViewProtocol? { get set }
    var interactor: TodoDetailInteractorInputProtocol? { get set}
    var router: TodoDetailRouterProtocol? { get set }
    
    // View -> Presneter
    func viewDidLoad()
    func editTodo(title:String, detail: String)
}
