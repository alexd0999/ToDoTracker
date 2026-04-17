//
//  ToDoTrackerTests.swift
//  ToDoTrackerTests
//
//  Created by Alex Arthur on 3/5/26.
//

import XCTest
//imports main app code so the test file can read
@testable import ToDoTracker

final class ToDoTrackerTests: XCTestCase {

    // A: TDD Requirement - test if a task has a priority
    func testTaskHasPriority() {
        //create task
        var task = TaskItem(title: "Complete Homework")
        
        //assign it a priority (inevitable error)
        task.priority = .high
        
        //checks that priority successfully saved as .high
        XCTAssertEqual(task.priority, .high)
    }
    
    // B: Unit Test Requirement -  test adding a task
    func testAddingTask() {
        //create blank group
        var workGroup = TaskGroup(title: "Work", symbolName: "briefcase", tasks: [])
        
        //add task to group
        let newTask = TaskItem(title: "Buy Groceries")
        workGroup.tasks.append(newTask)
        
        //checks group item count
        XCTAssertEqual(workGroup.tasks.count, 1)
        //checks item name matches input
        XCTAssertEqual(workGroup.tasks[0].title, "Buy Groceries")
    }
}
