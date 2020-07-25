//
//  ToDoItemView.swift
//  PM
//
//  Created by jkdo on 2020/07/19.
//  Copyright © 2020 jkdo. All rights reserved.
//

import Foundation
import SwiftUI

struct ToDoItemView: View {
    var title: String = ""
    var createAt: Date?
    @State var isFinished: Bool
    
    
    private func date2String(time: Date?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:MM:SS"

        return dateFormatter.string(from: time!)
    }
    
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
            
                Text(date2String(time: createAt))
                    .font(.caption)
                    .strikethrough(isFinished ? true : false)
            }
        }
    }
}

#if DEBUG
struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemView(title: "My great todo", createAt: Date(), isFinished: true)
    }
}
#endif
