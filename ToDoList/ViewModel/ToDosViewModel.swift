//
//  ToDosViewModel.swift
//  ToDoList
//
//  Created by Che-lun Hu on 2024/7/26.
//

import Foundation

class ToDosViewModel: ObservableObject {
    /*
     @Published是swiftUI中非常好用的wrapper，它允許我們創建”可觀察的”object，當這些object發生更改時會自動宣布通知。SwiftUI將自動監控此類更改，並重新調用data的任何view的body屬性。
     無論何時更改帶有標記為 @Published的屬性的object，都會reload使用該object的所有view以反應這些更改。
     必須要先讓class符合ObservableObject protocol。
     */
    @Published var toDos: [ToDo] = []
    
    init() {
        // Temp Data here. Will eventually load in saved data.
        toDos.append(ToDo(item: "Learn Swift"))
        toDos.append(ToDo(item: "Build Apps"))
        toDos.append(ToDo(item: "Change the World!"))
    }
}
