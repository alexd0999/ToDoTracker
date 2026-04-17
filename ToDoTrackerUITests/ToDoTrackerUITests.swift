//
//  ToDoTrackerUITests.swift
//  ToDoTrackerUITests
//
//  Created by Alex Arthur on 3/5/26.
//

import XCTest

final class ToDoTrackerUITests: XCTestCase {

    //runs right before every single test
    override func setUpWithError() throws {
        continueAfterFailure = false // If the test fails, stop immediately
    }

    // A: UI Test Requirement - add and view tasks
    func testAddingTask() throws {
        let app = XCUIApplication()
        app.launch() // Start the app
        
        // 1. Tap "Work" group in sidebar
        app.collectionViews.cells.staticTexts["Work"].tap()
        
        // 2. Tap "Add Task" button in top right
        let addTaskButton = app.buttons["Add Task"]
        XCTAssertTrue(addTaskButton.waitForExistence(timeout: 2.0))
        addTaskButton.tap()
        
        // 3. Find the created text field, tap, type
        sleep(1) //wait 1 second for new task animation
                
        //count text fields, grab the last one on the list
        let lastIndex = app.textFields.count - 1
        let newTaskField = app.textFields.element(boundBy: lastIndex)
                
        newTaskField.tap()
        newTaskField.typeText("Complete Assignment")
        
        // 4. Verify typed text is present on screen
        XCTAssertTrue(app.textFields["Complete Assignment"].exists)
    }
    
    // B: UI Test Requirement - complete task
    func testMarkTaskCompleted() throws {
        let app = XCUIApplication()
        app.launch()
        
        // 1. Go into "Work" group
        app.collectionViews.cells.staticTexts["Work"].tap()
        
        // 2. Find the first checked toggle
        let completeToggle = app.images["CompleteToggle"].firstMatch
        XCTAssertTrue(completeToggle.waitForExistence(timeout: 2.0))
        
        // 3. Tap to complete task
        completeToggle.tap()
        
    }
}
