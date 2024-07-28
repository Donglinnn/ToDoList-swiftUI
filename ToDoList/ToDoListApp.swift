//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Che-lun Hu on 2024/7/24.
//

import SwiftUI

@main
struct ToDoListApp: App {
    /*
     An EnvironmentObject is available across SwiftUI Views, so you don't have to pass an object from View to View(i.e. the App) after it's been created.
     When working with an EnvironmentObject you want to share across Views:
     - Use @StateObject to create an instance of an ObservableObject class.
     - Use the .environmentObject modifier below the first View where the object will be available, passing in the object you created with @StateObject, above.
     You'll be able to access this object from this first View and any Views that it creates.
    */
    /*
     @StateObject - is used to create and object from an ObservableObject class.
     Use @StateObject to create the first instance of an object that uses a class that conforms to ObservableObject.
     Changes to this object's @Published properties will announce themselves to SwiftUI and trigger interface updates.
     Use only once per object.
    */
    @StateObject var toDosVM = ToDosViewModel() // Create an instance of ToDosVM class.
                                                // 創建完後，只需要在會需要用到這個物件的View的Preview中後面加上.environmentObject modifier將class從環境引入那個View
                                                // 然後在那個View的開頭將引入的東西用@EnvironmentObject propertyWrapper設成變數做引用
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .environmentObject(toDosVM)
        }
    }
}
