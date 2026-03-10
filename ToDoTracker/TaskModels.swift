//
//  TaskModels.swift
//  ToDoTracker
//
//  Created by Alex Arthur on 3/5/26.
//

import Foundation

//each task gets a unique id
struct TaskItem: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}

struct TaskGroup: Identifiable, Hashable {
    let id: UUID = UUID()
    var title: String
    var symbolName: String
    var tasks: [TaskItem]
}

//mock data
extension TaskGroup {
    static let sampleData: [TaskGroup] = [
        TaskGroup(title: "Work", symbolName: "briefcase", tasks: [
            TaskItem(title: "Finish report"),
            TaskItem(title: "Call client"),
            TaskItem(title: "Send proposal")
        ]),
        TaskGroup(title: "Personal", symbolName: "person.fill", tasks: [
            TaskItem(title: "Buy groceries")
            ]),
        TaskGroup(title: "Exercise", symbolName: "figure.run", tasks: [ 
                TaskItem(title: "Go for a run", isCompleted: true),
                TaskItem(title: "Take a yoga class")
            ])
        ]
}
