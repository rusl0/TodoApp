//
//  TodoDTO.swift
//  Todo
//
//  Created by Ruslan Kandratsenka on 21.04.25.
//

import Foundation

struct TodoDTO: Decodable {
    let id: Int32
    let todo:String
    let completed: Bool
    let userId: Int32
}
