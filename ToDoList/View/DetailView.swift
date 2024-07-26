//
//  DetailView.swift
//  ToDoList
//
//  Created by Che-lun Hu on 2024/7/24.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var toDosVM: ToDosViewModel
    @State var toDo = ToDo()
    var newToDo = false
    
    var body: some View {
        List {
            TextField("Enter To Do Here", text: $toDo.item)
                .font(.title)
                .textFieldStyle(.roundedBorder)
                .padding(.vertical)
                .listRowSeparator(.hidden)
            
            Toggle("Set Reminder", isOn: $toDo.reminderIsOn)
                .padding(.top)
                .listRowSeparator(.hidden)
            
            DatePicker("Date", selection: $toDo.dueDate)
                .listRowSeparator(.hidden)
                .disabled(!toDo.reminderIsOn)
            
            Text("Notes: ")
                .padding(.top)
            TextField("Notes", text: $toDo.notes, axis: .vertical)   // axis: 隨著文字增加而延伸的方向
                .textFieldStyle(.roundedBorder)
                .listRowSeparator(.hidden)
            
            Toggle("Completed:", isOn: $toDo.isCompleted)
                .padding(.top)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        /*
         Need to create toolbar for the topmost buttons.
         Three steps:
         1. Inside a navigationStack
         2. .toolbar
         3. ToolbarItem
         */
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    // if new, append to toDoVM.todos else update the toDo that was passed in from the list.
                    if newToDo {
                        toDosVM.toDos.append(toDo)
                        dismiss()
                    }
                }
            }
        })
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    NavigationStack {
        DetailView(toDo: ToDo())
            .environmentObject(ToDosViewModel())
    }
}
