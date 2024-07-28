//
//  ToDo.swift
//  ToDoList
//
//  Created by Che-lun Hu on 2024/7/26.
//

import Foundation

    // Codable:
    // We need to store our data to the device and read data from the device.
    // Codable means it can convert itself into and out of an external representation.
struct ToDo: Identifiable, Codable {
//    let id = UUID().uuidString  // UUID: Universally Unique IDentifier - an accepted standard for creating 128 bit(36 character) unique codes.
    // We define id as an optional, it'll be created as nil unless we explicitly initialized.
    // Since it's an optional, it can be nil and the code won't crash, and we can check to see if the property is nil.
    var id: String?
    
    var item = ""
    var notes = ""
    var isCompleted = false
    var reminderIsOn = false
    var dueDate = Date.now + (60*60*24)  // One day from now
}
