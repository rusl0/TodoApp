//
//  TodoListViewCell.swift
//  Todo
//
//  Created by Ruslan Kandratsenka on 20.04.25.
//

import UIKit

struct Test {
    let todo:String?
    let todoDescription:String?
    let completed: Bool
    let creationDate: Date?
}

class TodoListViewCell: UITableViewCell {
    
    @IBOutlet weak private var readStatusImage: UIImageView!
    
    @IBOutlet weak private var todoTitle: UILabel!
    @IBOutlet weak private var todoDescription: UILabel!
    @IBOutlet weak private var todoDate: UILabel!
    
    func configure(with item: TodoItem) {
        
        let attributed = NSMutableAttributedString(string: item.todo ?? "")
        todoDescription.text = item.todoDescription ?? ""
        todoDate.text = dateFormatter().string(from: item.creationDate ?? Date.now)
        let range = NSRange(location: 0, length: attributed.length)
        if item.completed {
            readStatusImage.image = UIImage(named: "fill_checkmark")
            
            attributed.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: range)
            attributed.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: "WhiteColor50"), range: range)
            
            todoDescription.textColor = UIColor(named: "WhiteColor50")
        } else {
            readStatusImage.image = UIImage(named: "checkmark")
            attributed.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: "WhiteColor"), range: range)
            
            todoDescription.textColor = UIColor(named: "WhiteColor")
        }
        
        todoTitle.attributedText = attributed
        
    }
    
    
    func compeleStatus(is value: Bool) {
        
        if value {
            readStatusImage.image = UIImage(named: "fill_checkmark")
        } else {
            readStatusImage.image = UIImage(named: "checkmark")
        }
    }
}
