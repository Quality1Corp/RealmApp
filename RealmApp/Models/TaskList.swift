//
//  TaskList.swift
//  RealmApp
//
//  Created by MikhaiL on 01.06.2023.
//

import Foundation

final class TaskList {
    var title = ""
    var date = Date()
    var tasks: [Task] = []
}

final class Task {
    var title = ""
    var note = ""
    var date = Date()
    var isComplete = false
}
