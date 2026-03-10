//
//  TaskGroupDetailView.swift
//  ToDoTracker
//
//  Created by Alex Arthur on 3/5/26.
//

import SwiftUI

struct TaskGroupDetailView: View {
    //allowed to modify data from contentview
    @Binding var group: TaskGroup
    
    //asks device "wide or narrow?"
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        List {
            //if wide, show statistics view
            if sizeClass == .regular {
                Section {
                    GroupStatsView(tasks: group.tasks)
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.clear)
                }
            }
            
            //displays tasks
            Section("Tasks") {
                ForEach($group.tasks) { $task in
                    HStack {
                        //checkmark button
                        Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                            .foregroundStyle(task.isCompleted ? .blue : .primary)
                            .font(.title3)
                            .onTapGesture {
                               
                                withAnimation(.spring()) {
                                    task.isCompleted.toggle()
                                }
                            }
                        
                        //task input
                        TextField("New Task...", text: $task.title)
                            .strikethrough(task.isCompleted)
                            .foregroundStyle(task.isCompleted ? .gray : .primary)
                    }
                    .padding(.vertical, 4)
                }
                //swipe to delete
                .onDelete { index in
                    group.tasks.remove(atOffsets: index)
                }
            }
        }
        .navigationTitle(group.title)
        .toolbar {
            Button {
                withAnimation {
                    group.tasks.append(TaskItem(title: ""))
                }
            } label: {
                Label("Add Task", systemImage: "plus")
            }
        }
    }
}
