//
//  TodoListInteractor.swift
//  Todo
//
//  Created by Ruslan Kandratsenka on 22.04.25.
//

import Foundation

class TodoListInteractor: TodoListInteractorInputProtocol {
    
    let urlString = "https://drive.usercontent.google.com/u/0/uc?id=1MXypRbK2CS9fqPhTtPonn580h1sHUs2W&export=download"
    
    
    weak var presenter: TodoListInteractorOutputProtocol?
    var todoStore = TodoDataSource.shared
    var todos: [TodoItem] {
        return todoStore.todos
    }
    
    func retrieveTodos() {
        DispatchQueue.global().async {
            self.todoStore.loadData()
            DispatchQueue.main.async {
                self.presenter?.didRetrieveTodos(self.todos)
            }
        }
    }
    
    func saveTodo(_ todo: TodoItem) {
        DispatchQueue.global().async {
            self.todoStore.saveTodos()
            self.todoStore.loadData()
            
            DispatchQueue.main.async {
                self.presenter?.didRetrieveTodos(self.todos)
            }
        }
    }
    
    func deleteTodo(_ todo: TodoItem) {
        
        DispatchQueue.global().async {
            self.todoStore.removeTodo(todo)
            DispatchQueue.main.async {
                self.presenter?.didRemoveTodo(todo)
            }
        }
    }
    
    // Fetch data from remote
    func fetchTodos() {
        
        
        guard !UserDefaults.standard.bool(forKey: "DataIsUpdated"),
        let url = URL(string: urlString) else {
            return
        }
        
        let request = URLRequest(url: url)
        
        // loading data asynchronously
        let task = URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let jsonData = data else {
                return
            }
            
            // Parse JSON to data model
            guard let todos = try? JSONDecoder().decode(TodosDTO.self, from:  jsonData) else { return }
            self.todoStore.addTodos(from: todos.todos)
            
            UserDefaults.standard.set(true, forKey: "DataIsUpdated")
            
            self.todoStore.loadData()
            DispatchQueue.main.async {
                // pass data to presenter
                self.presenter?.didRetrieveTodos(self.todos)
            }
        }
        task.resume()
    }
    
    func updateCounter() {
        presenter?.didUpdateCounter()
    }
}
