//
//  TodoListInteractorTests.swift
//  TodoTests
//
//  Created by Ruslan Kandratsenka on 24.04.25.
//

import XCTest
@testable import Todo

final class TodoListInteractorTests: XCTestCase {

    
    override class func setUp() {
        
        UserDefaults.standard.set(false, forKey: "DataIsUpdated")
        TodoDataSource.shared.persistent = PersistentController(inMemory: true)
    }
    
    func testIntefactorFetchData() throws {
        let interactor = TodoListInteractor()
        let presenter = TodoListPresenterMock()
        interactor.presenter = presenter
        
        let expectation = XCTestExpectation(description: "Fetch data")
        
        presenter.downloadCompleted = { todos in
            
            XCTAssert(todos.count == 30)
            expectation.fulfill()
        }
        
        interactor.fetchTodos()
        
        wait(for: [expectation], timeout: 15.0)
    }

}
