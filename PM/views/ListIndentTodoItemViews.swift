//
//  ToDoItemView.swift
//  PM
//
//  Created by jkdo on 2020/07/19.
//  Copyright © 2020 jkdo. All rights reserved.
//

import Foundation
import SwiftUI

struct ListIndentTodoItemViews: View {
    var todoItem : ToDoItem
    
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                Button(action: {
                    self.todoItem.isFinished.toggle()
                }) {
                    Image(systemName: todoItem.isFinished ? "checkmark.square" : "square")
                        .font(.title)
                }
            }.padding([.leading], CGFloat(Int.random(in: 0..<30)))
            /*
            VStack(alignment: .leading) {
                Text(todoItem.title!)
                    .font(.headline)
                    .strikethrough(todoItem.isFinished ? true : false)
                
                Text(toDoItem.date2String(time: todoItem.createAt!))
                    .font(.caption)
                    .strikethrough(todoItem.isFinished ? true : false)
            }
            Spacer()
            
            HStack{
                HStack {
                    Image(systemName: "increase.indent")
                        .imageScale(.large)
                        .frame(minWidth: 40)
                }
                .padding([.leading, .trailing], 3)
                
                HStack {
                    EmptyView()
                }
                .padding([.leading, .trailing], 3)
                
                HStack {
                    Image(systemName: "decrease.indent")
                        .imageScale(.large)
                        .frame(minWidth: 20)
                }
                .padding([.leading], 3)
            }.padding()
            */
        }
    }
}


/*
 #if DEBUG
 struct ListIndentTodoItemViews_Previews: PreviewProvider {
 static var previews: some View {
 ListIndentTodoItemViews(title: "New Item", createAt: Date(), isFinished: false)
 }
 }
 #endif
 */
