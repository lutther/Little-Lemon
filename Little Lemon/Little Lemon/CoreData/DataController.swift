//
//  DataController.swift
//  Little Lemon
//
//  Created by luther on 2023/08/31.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    static let controller = DataController()
    
    var container: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    init() {
        container = NSPersistentContainer(name: "LittleLemon")
        container.loadPersistentStores{_,_ in }
    }
    
    func getDishes() -> [Dish] {
        let fetchRequest: NSFetchRequest<Dish> = NSFetchRequest(entityName: "Dish")
        
        do {
            return try viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func save() {
        do {
            try viewContext.save()
        } catch {
            print("Error while saving")
        }
    }
    
    func clear() {
        // Delete all dishes from the store
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Dish")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        let _ = try? container.persistentStoreCoordinator.execute(deleteRequest, with: container.viewContext)
    }
}
