//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Che-lun Hu on 2024/7/24.
//

import SwiftUI

struct ToDoListView: View {
    @State private var sheetIsPresented = false
    @EnvironmentObject var toDosVM: ToDosViewModel
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDosVM.toDos) { toDo in
                    NavigationLink {
                        DetailView(toDo: toDo)
                    } label: {
                        Text(toDo.item)
                    }
                }
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        sheetIsPresented.toggle()   // true -> false/false -> true
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            })
            // A sheet shows from buttom to top
            // fullScreenCover acts same as sheet but it covers the whole screen.
            .sheet(isPresented: $sheetIsPresented, content: {
                NavigationStack {
                    DetailView(toDo: ToDo(), newToDo: true)    // new value
                }
            })
        }
    }
}

#Preview {
    ToDoListView()
        .environmentObject(ToDosViewModel())
}

