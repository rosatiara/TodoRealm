//
//  TaskRow.swift
//  ToDo
//
//  Created by T on 19/12/21.
//

import SwiftUI

struct TaskRow: View {
    var task: String
    var completed: Bool
    var body: some View {
        HStack(spacing:18) {
            Image(completed ? "check-circle" : "circle")
            Text(task)
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: "Learn SwiftUI", completed: true)
    }
}
