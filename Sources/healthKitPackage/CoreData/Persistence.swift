//
//  Persistence.swift
//  healthKitConnector
//
//  Created by Klaus-Dieter Reiners on 21.03.21.
//

import CoreData

public class PersistenceController {
    
    static let shared = PersistenceController()
    static var preview: PersistenceController = {
        let result = PersistenceController()
        let viewContext = result.cloudContainer.viewContext
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let cloudContainer: NSPersistentCloudKitContainer
    
    init() {
        let bundle = Bundle.module
         let modelURL = bundle.url(forResource: "healthKitConnector", withExtension: ".momd")!
         let model = NSManagedObjectModel(contentsOf: modelURL)!
         cloudContainer = NSPersistentCloudKitContainer(name: "healthKitConnector", managedObjectModel: model)
        
//        cloudContainer = NSPersistentCloudKitContainer(name: "healthKitConnector")
        cloudContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                Typical reasons for an error here include:
                * The parent directory does not exist, cannot be created, or disallows writing.
                * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                * The device is out of space.
                * The store could not be migrated to the current model version.
                Check the error message to determine what the actual problem was.
                */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        cloudContainer.viewContext.automaticallyMergesChangesFromParent = true
        cloudContainer.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }
}
