//
//  DataManager.swift
//  RealmApp
//
//  Created by MikhaiL on 01.06.2023.
//

import Foundation

final class DataManager {
    static let shared = DataManager()
    private let storageManager = StorageManager.shared
    
    private init() {}
    
    func createTempData(completion: @escaping () -> Void) {
        let shoppingList = TaskList()
        shoppingList.title = "Shopping List"
        
        let moviesList = TaskList(
            value: [
                "Movies List",
                Date(),
                [
                    ["The Shawshank Redemption"] as [Any],
                    ["Green Book", "View today", Date(), true]
                ]
            ] as [Any]
        )
        
        let milk = Task()
        milk.title = "Carrot"
        milk.note = "2 kg"
        
        let apples = Task(value: ["Apples", "3 kg"])
        let bread = Task(value: ["title": "Bread", "isComplete": true] as [String : Any])
        
        shoppingList.tasks.append(milk)
        shoppingList.tasks.insert(contentsOf: [apples, bread], at: 1)
        
        DispatchQueue.main.async { [unowned self] in
            storageManager.save([shoppingList, moviesList])
            completion()
        }
    }
}
