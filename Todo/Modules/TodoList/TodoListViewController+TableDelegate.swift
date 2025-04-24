//
//  TodoListViewController+TableDelegate.swift
//  Todo
//
//  Created by Ruslan Kandratsenka on 22.04.25.
//

import Foundation

import UIKit

extension TodoListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = data[indexPath.row]
        todo.completed = !todo.completed
        presenter?.completeTodo(todo)
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { actions in
            
            let edit = UIAction(title: "Редактировать", image: UIImage(systemName: "square.and.pencil")) { action in
                self.presenter?.showTodoDetail(self.data[indexPath.row])
            }
            let share =  UIAction(title: "Поделиться", image: UIImage(systemName: "square.and.arrow.up")) { action in
                
                let todo: TodoItem
                if self.isFiltering {
                    todo = self.filtered[indexPath.row]
                } else {
                    todo = self.data[indexPath.row]
                }
                self.presenter?.showShare(todo)
            }
            let remove = UIAction(title: "Удалить", image: UIImage(systemName: "trash"), attributes:  .destructive) {
                action in
                self.tableView.beginUpdates()
                self.presenter?.removeTodo(self.data[indexPath.row])
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                self.tableView.endUpdates()
            }
            return UIMenu(title: "", children: [edit, share, remove])
        }
    }
}
