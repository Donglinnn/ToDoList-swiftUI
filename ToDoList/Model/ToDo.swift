//
//  ToDo.swift
//  ToDoList
//
//  Created by Che-lun Hu on 2024/7/26.
//

import Foundation

struct ToDo: Identifiable {
    let id = UUID().uuidString  // UUID: Universally Unique IDentifier - an accepted standard for creating 128 bit(36 character) unique codes.
    
    var item = ""
    var notes = ""
    var isCompleted = false
    var reminderIsOn = false
    var dueDate = Date.now + (60*60*24)  // One day from now
}
