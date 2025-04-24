//
//  ViewController.swift
//  Todo
//
//  Created by Ruslan Kandratsenka on 20.04.25.
//

import UIKit

class TodoListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var counter: UIBarButtonItem!
    
    let searchVontroller = UISearchController()
    
    var presenter: TodoListPresenterProtocol?
    var data: [TodoItem] = []
    var filtered: [TodoItem] = []
    
    func setupView() {
        counter.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(named: "WhiteColor")!], for: .disabled)
        
        tableView.dataSource = self
        tableView.delegate = self
        counter.title = "0 Задач"
    }
    
    func initSearchController() {
        searchVontroller.loadViewIfNeeded()
        searchVontroller.searchResultsUpdater = self
        searchVontroller.obscuresBackgroundDuringPresentation = false
        searchVontroller.searchBar.enablesReturnKeyAutomatically = false
        searchVontroller.searchBar.returnKeyType = UIReturnKeyType.done
        let whiteColor = UIColor(named: "WhiteColor")
        searchVontroller.searchBar.searchTextField.tintColor = whiteColor
        searchVontroller.searchBar.searchTextField.textColor = whiteColor
        
        // Set text color for searchBar
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes
            .updateValue(whiteColor!,
                         forKey:NSAttributedString.Key.foregroundColor)
        
        searchVontroller.searchBar.searchBarStyle = .prominent
        definesPresentationContext = true
        
        navigationItem.searchController = searchVontroller
        navigationItem.hidesSearchBarWhenScrolling = true
    }
    
    func configureModule() {
        let presenter = TodoListPresenter()
        let interactor = TodoListInteractor()
        let router = TodoListRouter()
                
        self.presenter = presenter
        presenter.view = self
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModule()
        initSearchController()
        setupView()
        presenter?.fetchTodo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }
    
    @IBAction func createNewTodo(_ sender: UIBarButtonItem) {
        let item = TodoItem(context: PersistentController.shared.viewContext)
        item.creationDate = Date.now
        presenter?.showTodoDetail(item)
    }
}


extension TodoListViewController: TodoListViewProtocol {
    func showErrorMessage(_ message: String) {
        
    }
    
    func showTodos(_ todos: [TodoItem]) {
        self.data = todos
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func removeTodo(_ todo: TodoItem) {
        if let index = self.data.firstIndex(of: todo) {
            self.data.remove(at: index)
        }
    }
    
    func updateCounter() {
        let count: Int
        if isFiltering {
            count = filtered.count
        } else {
            count = data.count
        }
        
        let restNum = count % 100
        let result: String
        if restNum > 10 && restNum < 19 {
            result = "Задач"
        } else {
            switch (restNum % 10) {
                case 1:
                    result = "Задача"
                case 2...4:
                    result = "Задачи"
                default:
                    result = "Задач"
            }
        }
        
        counter.title = "\(count) \(result)"
    }
    
    override var traitCollection: UITraitCollection {
      UITraitCollection(traitsFrom: [super.traitCollection, UITraitCollection(userInterfaceStyle: .dark)])
    }
}
