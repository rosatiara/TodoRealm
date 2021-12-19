//
//  AddTaskView.swift
//  ToDo
//
//  Created by T on 19/12/21.
//

import SwiftUI
struct AddTaskView: View {
    @State private var title: String = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("Create a new task")
                .foregroundColor(Color(red: 185 / 255, green: 117 / 255, blue: 80 / 255))
                .font(.title2).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("Enter your task", text: $title)
                .textFieldStyle(.roundedBorder)
            Button {
                print("Task added!")
            } label: {
                Text("Add task")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .frame(maxHeight:45)
                    .cornerRadius(30)
                    .background(Color(red: 203 / 255, green: 153 / 255, blue: 126 / 255)).ignoresSafeArea()
            }
            Spacer()
        }.padding(.top,70)
        .padding(.horizontal)
        .background(Color(red: 237 / 255, green: 220 / 255, blue: 210 / 255)).ignoresSafeArea()
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
