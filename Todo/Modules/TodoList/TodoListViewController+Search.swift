//
//  TodoListViewController+Search.swift
//  Todo
//
//  Created by Ruslan Kandratsenka on 23.04.25.
//

import UIKit

extension TodoListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text ?? ""
        filtered = data.filter { todo in
            if !searchText.isEmpty {
                return (todo.todo?.lowercased() ?? "").contains(searchText.lowercased())
            }
            return true
        }
        tableView.reloadData()
        presenter?.updateCounter()
    }
    
    var isSearchBarEmpty: Bool {
        return navigationItem.searchController?.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return navigationItem.searchController?.isActive ?? false && !isSearchBarEmpty
    }
}
