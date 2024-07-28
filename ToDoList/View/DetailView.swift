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
    
    var body: some View {
        List {
            TextField("Enter To Do Here", text: $toDo.item)
                .font(.system(.title, design: .rounded))
                .textFieldStyle(.roundedBorder)
                .padding(.vertical)
                .listRowSeparator(.hidden)
            
            Group {
                Toggle("Set Reminder", isOn: $toDo.reminderIsOn)
                    .listRowSeparator(.hidden)
                
                
                DatePicker("Date", selection: $toDo.dueDate)
                    .listRowSeparator(.hidden)
                    .disabled(!toDo.reminderIsOn)
                
                Text("Notes: ")
                
                TextField("Notes", text: $toDo.notes, axis: .vertical)   // axis: 隨著文字增加而延伸的方向
                    .textFieldStyle(.roundedBorder)
                    .listRowSeparator(.hidden)
                
                Toggle("Completed:", isOn: $toDo.isCompleted)
                    .listRowSeparator(.hidden)
            }
            .font(.system(.body, design: .rounded))
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
                    toDosVM.saveToDo(toDo: toDo)
                    dismiss()
                }
            }
        })
        .font(.system(.body, design: .rounded))
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
