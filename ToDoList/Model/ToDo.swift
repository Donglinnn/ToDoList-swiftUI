//
//  ToDosViewModel.swift
//  ToDoList
//
//  Created by Che-lun Hu on 2024/7/26.
//

import Foundation
import SwiftData

@Model
class ToDo {
    @Attribute(.unique) var item = ""
    var notes = ""
    var isCompleted = false
    var reminderIsOn = false
    var dueDate = Date.now + (60*60*24)  // One day from now
    
    init(item: String = "", notes: String = "", isCompleted: Bool = false, reminderIsOn: Bool = false, dueDate: Date = .now + (60*60*24)) {
        self.item = item
        self.notes = notes
        self.isCompleted = isCompleted
        self.reminderIsOn = reminderIsOn
        self.dueDate = dueDate
    }
}
