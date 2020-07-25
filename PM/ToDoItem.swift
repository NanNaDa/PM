//
//  ToDoItem.swift
//  PM
//
//  Created by jkdo on 2020/07/19.
//  Copyright © 2020 jkdo. All rights reserved.
//

import SwiftUI
import CoreData

public class ToDoItem: NSManagedObject, Identifiable {
    @NSManaged public var createdAt: Date?
    @NSManaged public var startDay: Date?
    @NSManaged public var finishDay: Date?
    @NSManaged public var title: String?
    @NSManaged public var isFinished: Bool
}

extension ToDoItem {
    static func getAllToDoItems() -> NSFetchRequest<ToDoItem> {
        let request: NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest() as! NSFetchRequest<ToDoItem>
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
    
    func date2String(time: Date?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:MM:SS"

        return dateFormatter.string(from: time!)
    }
}
