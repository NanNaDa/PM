//
//  ToDoListViews.swift
//  PM
//
//  Created by jkdo on 2020/07/25.
//  Copyright © 2020 jkdo. All rights reserved.
//

import SwiftUI

struct ToDoListViews: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    var toDoItems: FetchedResults<ToDoItem>
    @State private var showModal = false
    
    var body: some View {
        
        List {
            Section(header: Text("To Do's")) {
                ForEach(self.toDoItems) { toDoItem in
                    Button(action: {
                        print("hello button!!")
                        self.showModal = true
                    }){
                        ListTodoItemViews(toDoItem: toDoItem)
                    }
                    .sheet(isPresented: self.$showModal) {
                        EditTodoItem(toDoItem: toDoItem)
                    }
                    
                    
                    /*
                    VStack{
                        Text("Hello, World!")
                        Button(action: {
                            print("hello button!!")
                            self.showModal = true
                        }){
                            Text("Button")
                        }
                        .sheet(isPresented: self.$showModal) {
                            ModalView()
                        }
                    }
                    */
                    
                    // NavigationLink(destination: EditTodoItem(toDoItem: toDoItem)) {
                    // ListTodoItemViews(title: todoItem.title!, isFinished: todoItem.isFinished)
                    // ListTodoItemViews(toDoItem: toDoItem)
                    // }
                }
                .onDelete { indexSet in
                    let deleteItem = self.toDoItems[indexSet.first!]
                    self.managedObjectContext.delete(deleteItem)
                    
                    do {
                        try self.managedObjectContext.save()
                    } catch {
                        print(error)
                    }
                }
            }
        }
    }
}
/*
struct ToDoListViews_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListViews()
    }
}
*/
