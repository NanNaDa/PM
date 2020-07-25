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
        return AnyView(Button(action: {}) {
            Text("Cancel")
                .font(.largeTitle)
        })
    }
    
    private var save: some View {
        return AnyView(Button(action: {}) {
            Text("Save")
                .font(.largeTitle)
        })
    }
}
/*
import SwiftUI

struct ContentView: View {
    @State private var showModal = false
    
    var body: some View {
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
    }
}

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 */





/*
#if DEBUG
struct EditTodoItem_Previews: PreviewProvider {
    static var previews: some View {
        EditTodoItem()
    }
}
#endif
*/

