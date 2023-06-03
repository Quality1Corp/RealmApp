//
//  StorageManager.swift
//  RealmApp
//
//  Created by MikhaiL on 31.05.2023.
//

import RealmSwift

final class StorageManager {
    static let shared = StorageManager()
    
    let realm = try! Realm()
    
    private init() {}
    
    // MARK: - Task List
    func save(_ taskLists: [TaskList]) {
        try! realm.write {
            realm.add(taskLists)
        }
    }
    
    func save(_ taskList: String, completion: (TaskList) -> Void) {
        
    }
    
    func delete(_ taskList: TaskList) {
        
    }
    
    func edit(_ taskList: TaskList, newValue: String) {
        
    }
    
    func done(_ taskList: TaskList) {
        
    }
}
