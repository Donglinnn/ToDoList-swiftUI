//
//  DetailView.swift
//  ToDoList
//
//  Created by Che-lun Hu on 2024/7/24.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var toDo = ""
    @State private var notes = ""
    @State private var isCompleted = false
    @State private var reminderIsOn = false
    @State private var dueDate = Date.now + (60*60*24)  // One day from now
    var passedValue: String
    
    var body: some View {
        NavigationStack {
            List {
                TextField("Enter To Do Here", text: $toDo)
                    .font(.title)
                    .textFieldStyle(.roundedBorder)
                    .padding(.vertical)
                    .listRowSeparator(.hidden)
                
                Toggle("Set Reminder", isOn: $reminderIsOn)
                    .padding(.top)
                    .listRowSeparator(.hidden)
                
                DatePicker("Date", selection: $dueDate)
                    .listRowSeparator(.hidden)
                    .disabled(!reminderIsOn)
                
                Text("Notes: ")
                    .padding(.top)
                TextField("Notes", text: $notes, axis: .vertical)   // axis: 隨著文字增加而延伸的方向
                    .textFieldStyle(.roundedBorder)
                    .listRowSeparator(.hidden)
                
                Toggle("Completed:", isOn: $isCompleted)
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
                        //TODO: Add save code here
                    }
                }
            })
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    DetailView(passedValue: "Any toDo")
}
