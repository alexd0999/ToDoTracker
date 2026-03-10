//
//  GroupStatsView.swift
//  ToDoTracker
//
//  Created by Alex Arthur on 3/5/26.
//

import SwiftUI

struct GroupStatsView: View {
    var tasks: [TaskItem]
    
    //computes how many tasks are checked off
    var completedCount: Int { tasks.filter { $0.isCompleted }.count }
    
    //calculates the percentage
    var progress: Double { tasks.isEmpty ? 0 : Double(completedCount) / Double(tasks.count) }
    
    var body: some View {
        HStack(spacing: 20) {
            ZStack {
                Circle()
                    .stroke(lineWidth: 8)
                    .opacity(0.2)
                    .foregroundColor(.blue)
                
                //foreground circle
                Circle()
                    .trim(from: 0.0, to: progress)
                    .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round)) 
                    .foregroundColor(.blue)
                    .rotationEffect(.degrees(-90)) //starts circle at the top instead of the right
                    .animation(.easeInOut, value: progress)
                
                //percentage number inside the circle
                Text("\(Int(progress * 100))%")
                    .font(.caption.bold())
            }
            .frame(width: 70, height: 70)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Task Progress")
                    .font(.headline)
                Text("\(completedCount) of \(tasks.count) Completed")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(UIColor.secondarySystemGroupedBackground))
        )
        .padding(.horizontal)
    }
}
