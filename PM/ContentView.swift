//
//  ContentView.swift
//  PM
//
//  Created by jkdo on 2020/07/19.
//  Copyright © 2020 jkdo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItems()) var toDoItems: FetchedResults<ToDoItem>
    
    @State private var newTodoItem = ""
    @State private var pickerSelectedItem = 0
    var steprrer = 0
    
    var body: some View {
        VStack {
            Picker(selection: $pickerSelectedItem, label: Text("")) {
                HStack {
                    Image(systemName: "plus")
                        .font(.headline)
                }
                .tag(0)
                
                Text("menu 0")
                    .tag(1)
                
                Text("menu 1")
                    .tag(2)
                
                Text("menu 2")
                    .tag(3)
                
                Text("menu 3")
                    .tag(4)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 10)
            
            NavigationView {
                List {
                    
                    Section(header: Text("To Do's")) {
                        ForEach(self.toDoItems) { todoItem in
                            ToDoItemView(title: todoItem.title!, createAt: "\(todoItem.createdAt!)", isFinished: todoItem.isFinished)
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
                .navigationBarTitle(Text("My List"))
                .navigationBarItems(trailing: EditButton())
            }
            
            Spacer()
            
            HStack {
                TextField("New Item", text: self.$newTodoItem)
                Button(action: {
                    if self.newTodoItem.isEmpty == true {
                        return
                    }
                    
                    let toDoItem = ToDoItem(context: self.managedObjectContext)
                    toDoItem.title = self.newTodoItem
                    toDoItem.createdAt = Date()
                    
                    do {
                        try self.managedObjectContext.save()
                    } catch {
                        print(error)
                    }
                    
                    self.newTodoItem = ""
                }) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.green)
                        .imageScale(.large)
                }
            }
            .padding()
            
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
