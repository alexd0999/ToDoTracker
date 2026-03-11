//
//  NewGroupView.swift
//  ToDoTracker
//
//  Created by Alex Arthur on 3/10/26.
//


import SwiftUI

struct NewGroupView: View {
    @State private var groupName: String = ""
    @State private var selectedIcon: String = "list.bullet"
    
    //icons the user can choose from
    let icons: [String] = ["list.bullet", "bookmark.fill", "star.fill", "house.fill", "heart.fill", "briefcase.fill", "cart.fill", "graduationcap.fill"]
    
    //allows the view to dismiss itself
    @Environment(\.dismiss) var dismiss
    
    //sends the new group back to contentview
    var onSave: (TaskGroup) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                // SECTION A: Typing the name
                Section("Group Name") {
                    TextField("e.g. Work, School", text: $groupName)
                }
                
                // SECTION B: Picking an icon
                Section("Select Icon") {

                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 45))]) {
                        ForEach(icons, id: \.self) { icon in
                            Image(systemName: icon)
                                .font(.title2)
                                .frame(width: 45, height: 45)

                                .background(selectedIcon == icon ? Color.blue.opacity(0.2) : Color.clear)
                                .foregroundStyle(selectedIcon == icon ? Color.blue : Color.gray)
                                .clipShape(Circle())
                                .onTapGesture {

                                    withAnimation(.spring()) {
                                        selectedIcon = icon
                                    }
                                }
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("New Group")
            .toolbar {
                //cancel button on the left
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                
                //places save button on the right
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newGroup = TaskGroup(title: groupName, symbolName: selectedIcon, tasks: [])
                        onSave(newGroup) //sends group back
                        dismiss() //closes screen
                    }
                    .disabled(groupName.isEmpty) 
                }
            }
        }
    }
}