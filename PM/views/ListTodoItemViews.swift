//
//  ListTodoItemViews.swift
//  PM
//
//  Created by jkdo on 2020/07/25.
//  Copyright © 2020 jkdo. All rights reserved.
//

import SwiftUI

struct ListTodoItemViews: View {
    // var title: String = ""
    // @State var isFinished: Bool
    var toDoItem: ToDoItem
    
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                Button(action: {
                    self.toDoItem.isFinished.toggle()
                }) {
                    Image(systemName: toDoItem.isFinished ? "checkmark.square" : "square")
                        .font(.title)
                }
            }
            
            VStack(alignment: .leading) {
                Text(toDoItem.title!)
                    .font(.headline)
                    .strikethrough(toDoItem.isFinished ? true : false)
            }
            
            Spacer()
        }
    }
}
/*
#if DEBUG
struct ListTodoItemViews_Previews: PreviewProvider {
    static var previews: some View {
        ListTodoItemViews(title: "New Item", isFinished: false)
    }
}
#endif
*/
