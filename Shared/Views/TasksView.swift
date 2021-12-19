//
//  TasksView.swift
//  ToDo
//
//  Created by T on 19/12/21.
//

import SwiftUI

struct TasksView: View{
    @EnvironmentObject var realmManager: RealmManager
    var body: some View {
        VStack {
            Text("My tasks")
                .foregroundColor(Color(red: 185 / 255, green: 117 / 255, blue: 80 / 255))
                .font(.title2).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.top, 30)
            List {
                ForEach(realmManager.tasks, id: \.id){
                    task in
                    if !task.isInvalidated {
                        TaskRow(task: task.title, completed: task.completed)
                            .onTapGesture {
                                realmManager.updateTask(id: task.id, completed:!task.completed)
                            }
                            .swipeActions(edge: .trailing){
                                Button(role: .destructive){
                                    realmManager.deleteTask(id: task.id)
                                } label: {
                                     Image("trash")
                            }
                        }
                    }
                }
            }.onAppear{
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            } // make the list transparent
        }
        // make the VStack takes the entire screen
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 237 / 255, green: 220 / 255, blue: 210 / 255))
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environmentObject(RealmManager())
    }
}
