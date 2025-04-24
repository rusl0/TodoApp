//
//  DataSourceTests.swift
//  TodoTests
//
//  Created by Ruslan Kandratsenka on 24.04.25.
//

import XCTest

@testable import Todo

final class DataSourceTests: XCTestCase {

    override class func setUp() {
        UserDefaults.standard.set(true, forKey: "DataIsUpdated")
        TodoDataSource.shared.persistent = PersistentController(inMemory: true)
    }
    
    func testEmptyDataSource() throws {
        let dataSource = TodoDataSource.shared
        dataSource.loadData()
        XCTAssert(dataSource.todos.count == 0)
    }
    
    func testAddItem() throws {
        let dataSource = TodoDataSource.shared
        
        let todo = TodoDTO(id: 1, todo: "Title", completed: false, userId: 1)
        dataSource.addTodos(from: [todo])
        dataSource.loadData()
        XCTAssert(dataSource.todos.count == 1)
    }
    
    func testRemoveItem() throws {
        
        let dataSource = TodoDataSource.shared
        
        let todo = TodoDTO(id: 1, todo: "Title", completed: false, userId: 1)
        dataSource.addTodos(from: [todo])
        dataSource.loadData()
        XCTAssert(dataSource.todos.count == 1)
        
        dataSource.removeTodo(dataSource.todos[0])
        dataSource.loadData()
        XCTAssert(dataSource.todos.count == 0)
        
    }
}
