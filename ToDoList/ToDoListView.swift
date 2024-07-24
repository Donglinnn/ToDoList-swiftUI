//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Che-lun Hu on 2024/7/24.
//

import SwiftUI

struct ToDoListView: View {
    @State private var sheetIsPresented = false
    var toDos = ["Learn Swift",
                 "Build Apps",
                 "Change the World",
                 "Bring the Awesome",
                 "Take a Vacation"]
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDos, id: \.self) { toDo in
                    NavigationLink {
                        DetailView(passedValue: toDo)
                    } label: {
                        Text(toDo)
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
                DetailView(passedValue: "")
            })
        }
    }
}

#Preview {
    ToDoListView()
}

