//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Che-lun Hu on 2024/7/24.
//

import SwiftUI

struct ToDoListView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    DetailView()
                } label: {
                    Image(systemName: "eye")
                    Text("Show the New View!")
                }
                .buttonStyle(.borderedProminent)
                .tint(.cyan)
            }
            .padding()
        }
    }
}

#Preview {
    ToDoListView()
}

