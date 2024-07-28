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
                // Shorthand calls to .onDelete and .onMove
                .onDelete(perform: toDosVM.deleteToDo)
                .onMove(perform: toDosVM.moveToDo)
                // Traditional calls are below
                // When we swipe left or perform some other row-deleting action, SwiftUI will pass in the rows selected in the form of indexSet.
                // we move the perform to a function inside the ViewModel.
//                .onDelete(perform: { indexSet in
//                    toDosVM.delete(indexSet: indexSet)
//                })
                // When we click the Edit button, the move dragging button shows up at the right side of all toDos, by dragging that, we can change the order of the list.
                // we move the perform to a function inside the ViewModel.
//                .onMove(perform: { indices, newOffset in
//                    toDosVM.toDos.move(fromOffsets: indices, toOffset: newOffset)
//                })
            }
            .navigationTitle("To Do List")
            .font(.system(.body, design: .rounded))
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                        .font(.system(.body, design: .rounded))
                }
                
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
                    DetailView(toDo: ToDo())    // new value
                }
            })
        }
    }
}

#Preview {
    ToDoListView()
        .environmentObject(ToDosViewModel())
}

