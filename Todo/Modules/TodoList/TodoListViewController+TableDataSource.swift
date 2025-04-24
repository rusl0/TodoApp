//
//  TodoListViewController+TableDataSource.swift
//  Todo
//
//  Created by Ruslan Kandratsenka on 22.04.25.
//

import UIKit

extension TodoListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filtered.count
        }
        return data.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoItemCell", for: indexPath) as! TodoListViewCell
        let todo: TodoItem
        if isFiltering {
            todo = filtered[indexPath.row]
        } else {
            todo = data[indexPath.row]
        }
        
        cell.configure(with: todo)
        
        return cell
    }
}
