//
//  DetailTodoViewController.swift
//  Todo
//
//  Created by Ruslan Kandratsenka on 22.04.25.
//

import Foundation

import UIKit

class TodoDetailViewController: UIViewController {
    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    
    var presenter: TodoDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextView.delegate = self
        detailTextView.delegate = self
        
        presenter?.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        presenter?.editTodo(title: titleTextView.text, detail: detailTextView.text)
    }
}

extension TodoDetailViewController: TodoDetailViewProtocol {
    func showTodo(_ todo: TodoItem) {
        dateLabel.text = dateFormatter().string(for: todo.creationDate)
        
        titleTextView.text = todo.todo ?? ""
        detailTextView.text = todo.todoDescription ?? ""
        
        if titleTextView.text.isEmpty {
            titleTextView.text = "Новая задача"
            titleTextView.textColor = UIColor(named: "WhiteColor50")
        }
        
        if detailTextView.text.isEmpty {
            detailTextView.text = "Новая задача"
            detailTextView.textColor = UIColor(named: "WhiteColor50")
        }
    }
}

extension TodoDetailViewController: UITextViewDelegate {
    internal func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor(named: "WhiteColor50") {
            textView.text = ""
            textView.textColor = UIColor(named: "WhiteColor")
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Новая задача"
            textView.textColor = UIColor(named: "WhiteColor50")
        }
    }
}
