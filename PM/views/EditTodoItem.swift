//
//  EditTodoItem.swift
//  PM
//
//  Created by jkdo on 2020/07/25.
//  Copyright © 2020 jkdo. All rights reserved.
//

import SwiftUI

struct EditTodoItem: View {
    var toDoItem: ToDoItem
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Environment(\.managedObjectContext) var managedObjectContext

    var body: some View {
        NavigationView {
            HStack {
                Text(toDoItem.date2String(time: toDoItem.createdAt))
                // Text(toDoItem.date2String(time: toDoItem.startDay))
                // Text(toDoItem.date2String(time: toDoItem.finishDay))
                Text(toDoItem.title!)
                Text(toDoItem.isFinished ? "true" : "false")
            }
            .navigationBarTitle(toDoItem.title!)
            .navigationBarItems(
                leading: cancel,
                trailing: save)
        }
    }
    
    
    private var cancel: some View {
        Group {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Cancel")
            }
        }
    }
    
    private var save: some View {
        Group {
            Button(action: {
                do {
                    try self.managedObjectContext.save()
                } catch {
                    print(error)
                }
            }) {
                Text("Save")
            }
        }
    }
}


/*
 🔳 reference (model example)
   - https://ericasadun.com/2019/06/16/swiftui-modal-presentation/
 
 */
