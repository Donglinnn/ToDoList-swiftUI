//
//  ToDosViewModel.swift
//  ToDoList
//
//  Created by Che-lun Hu on 2024/7/26.
//

import Foundation

    // 宣告ToDosViewModel class 中的物件為一個可被觀察的物件，並利用@Published表示這個變量想讓別人來觀察
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
    
    func saveToDo(toDo: ToDo, newToDo: Bool) {
        // if new, append to toDoVM.todos else update the toDo that was passed in from the list.
        if newToDo {
            toDos.append(toDo)
        } else {
            // Updating toDo whenever we want:
            // firstIndex(where:{}) is to find the index of the first element that suits the statement inside where, i.e, the statement is true.
            // Because it may not has suitable element to return, it returns Index?. Therefore, we have to use the if let keyword to unwrap(although in this case we will always find the suitable element).
            // $0 is the shorthand of iteration, means the current element that iterator currently iterate on.
            // index will be the index in the toDos array that its id == toDo.id, i.e, find out the current toDo that we are try to update inside the toDos array of toDosVM, so that we can update the content of the specific toDo.
            if let index = toDos.firstIndex(where: {$0.id == toDo.id}) {
                toDos[index] = toDo
            }
        }
    }
}
