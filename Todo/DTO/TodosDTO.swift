//
//  TodosDTO.swift
//  Todo
//
//  Created by Ruslan Kandratsenka on 21.04.25.
//

import Foundation

struct TodosDTO: Decodable {
    let todos: [TodoDTO]
    let total: Int32
    let skip: Int32
    let limit: Int32
}
