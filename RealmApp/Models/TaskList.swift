//
//  TaskList.swift
//  RealmApp
//
//  Created by MikhaiL on 01.06.2023.
//

import Foundation
import RealmSwift

final class TaskList: Object {
    @Persisted var title = ""
    @Persisted var date = Date()
    @Persisted var tasks = List<Task>()
}

final class Task: Object {
    @Persisted var title = ""
    @Persisted var note = ""
    @Persisted var date = Date()
    @Persisted var isComplete = false
}
