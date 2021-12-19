//
//  TasksView.swift
//  ToDo
//
//  Created by T on 19/12/21.
//

import SwiftUI

struct TasksView: View{
    var body: some View {
        VStack {
            Text("My tasks")
                .foregroundColor(Color.white)
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
        }
        // make the VStack takes the entire screen
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0 / 255, green: 8 / 255, blue: 20 / 255))
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
