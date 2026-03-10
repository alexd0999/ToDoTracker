//
//  ContentView.swift
//  ToDoTracker
//
//  Created by Alex Arthur on 3/5/26.
//

import SwiftUI

struct ContentView: View {
    //when these variables change, the UI will automatically update
    @State private var taskGroups = TaskGroup.sampleData
    @State private var selectedGroup: TaskGroup?
    
    //controls how the sidebar behaves
    @State private var columnVisibility: NavigationSplitViewVisibility = .all
    @State private var isShowingAddGroup: Bool = false
    
    var body: some View {
        
        NavigationSplitView(columnVisibility: $columnVisibility) {
            
           // COLUMN A: The Master List (left side)
            List(selection: $selectedGroup) {
                ForEach(taskGroups) { group in
                    NavigationLink(value: group) {
                        Label(group.title, systemImage: group.symbolName)
                    }
                }
            }
            .navigationTitle("ToDo Tracker")
            .listStyle(.sidebar)
            .toolbar {
                Button {
                    isShowingAddGroup = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                }
            }
            
        } detail: {
            // COLUMN B: The Detail View (right side)
            if let group = selectedGroup {

                if let index = taskGroups.firstIndex(where: { $0.id == group.id}) {
                    TaskGroupDetailView(group: $taskGroups[index])
                }
            } else {

                ContentUnavailableView(
                    "Select a Group",
                    systemImage: "hand.tap",
                    description: Text("Choose a category from the sidebar to view or add tasks.")
                )
            }
        }
        .sheet(isPresented: $isShowingAddGroup) {
            NewGroupView { newGroup in
                taskGroups.append(newGroup)
                selectedGroup = newGroup //automatically selects the new group
            }
        }
    }
}
