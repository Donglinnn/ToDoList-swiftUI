//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Che-lun Hu on 2024/7/24.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
    @State private var sheetIsPresented = false
    // @Query fetches data from Swiftdata's ModelContainer, so they can be displayed in SwiftUI Views.
    // @Query variables will also trigger View updates on every change data (similar to how @State weorks).
    @Query var toDos: [ToDo]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDos) { toDo in
                    HStack {
                        Image(systemName: toDo.isCompleted ? "checkmark.rectangle" : "rectangle")
                            .onTapGesture {
                                toDo.isCompleted.toggle()
                            }
                        NavigationLink {
                            DetailView(toDo: toDo)
                        } label: {
                            Text(toDo.item)
                        }
                    }
                    .font(.system(.title2, design: .rounded))
                    .swipeActions {
                        Button("Delete", role: .destructive) {
                            modelContext.delete(toDo)
                        }
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
                    DetailView(toDo: ToDo())    // new value
                }
            })
            
        }
    }
}

#Preview {
    ToDoListView()
}

