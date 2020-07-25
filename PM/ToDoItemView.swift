//
//  ToDoItemView.swift
//  PM
//
//  Created by jkdo on 2020/07/19.
//  Copyright © 2020 jkdo. All rights reserved.
//

import SwiftUI

struct ToDoItemView: View {
    var title: String = ""
    var createAt: String = ""
    @State var isFinished: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                Button(action: {
                    self.isFinished.toggle()
                }) {
                    Image(systemName: isFinished ? "checkmark.square" : "square")
                        .font(.title)
                }
            }.padding([.leading], CGFloat(Int.random(in: 0..<30)))
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .strikethrough(isFinished ? true : false)
            
                Text(createAt)
                    .font(.caption)
                    .strikethrough(isFinished ? true : false)
            }
        }
    }
}

#if DEBUG
struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemView(title: "My great todo", createAt: "Today", isFinished: true)
    }
}
#endif
