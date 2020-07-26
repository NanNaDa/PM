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
    
    @State private var newToDoItem = ""
    @State private var pickerSelectedItem = 0
    var steprrer = 0
    
    
    /*
     Section(header: Text("Chapter".uppercased())) {
     ForEach(dataSource.loadDataSource(relatedTo: book)) { chapter in
     
     if self.editMode == .active {
     ChapterListCell(chapter: chapter)
     } else {
     NavigationLink(destination: ChapterView(chapter: chapter)) {
     // NavigationLink(destination: ChapterView(chapter: chapter)) {
     ChapterListCell(chapter: chapter)
     }
     }
     }
     .onMove(perform: self.dataSource.move)
     .onDelete(perform: self.dataSource.delete)
     }
     */
    var body: some View {
        NavigationView {
            VStack {
                Picker(selection: $pickerSelectedItem, label: Text("")) {
                    HStack {
                        Image(systemName: "list.bullet")
                            
                            .font(.headline)
                    }.padding(5)
                        .tag(0)
                    
                    HStack {
                        Image(systemName: "calendar")
                            .font(.headline)
                    }
                    .padding(5)
                    .tag(1)
                    
                    HStack {
                        Image(systemName: "list.bullet.indent")
                            .font(.headline)
                    }
                    .padding(5)
                    .tag(2)
                    
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 5)
                
                ToDoListViews(toDoItems: toDoItems)
                
                Spacer()
                
                HStack {
                    TextField("New ITem", text: self.$newToDoItem)
                    Button(action: {
                        if self.newToDoItem.isEmpty == true {
                            return
                        }
                        
                        let toDoItem = ToDoItem(context: self.managedObjectContext)
                        toDoItem.title = self.newToDoItem
                        toDoItem.createdAt = Date()
                        
                        do {
                            try self.managedObjectContext.save()
                        } catch {
                            print(error)
                        }
                        
                        self.newToDoItem = ""
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.green)
                            .imageScale(.large)
                    }
                    .padding()
                }
                .padding()
            }
            .navigationBarTitle(Text("My List"))
            .navigationBarItems(trailing: userEnvironment)
            
        }
    }
    
    private var userEnvironment: some View {
        return AnyView(Button(action: {}) {
            Image(systemName: "person.circle.fill")
                .font(.largeTitle)
        })
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif


struct ModalView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Group {
            Text("Modal view")
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Dismiss")
            }
        }
    }
}
