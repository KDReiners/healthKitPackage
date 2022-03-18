// Create a subclass of NSPersistentStore Coordinator

import CoreData
open class PersistentCloudKitContainer: NSPersistentCloudKitContainer {
}
    
public var persistentCloudKitContainer: PersistentCloudKitContainer? = {
        guard let modelURL = Bundle.module.url(forResource:"healthKitConnector", withExtension: "momd") else { return  nil }
        guard let model = NSManagedObjectModel(contentsOf: modelURL) else { return nil }
        let container = PersistentCloudKitContainer(name:"healthKitConnector",managedObjectModel:model)
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//                print("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
        return container
    }()
public struct PersistenceController {
    public static let shared = PersistenceController()
    public static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
//        for _ in 0..<10 {
//            let newItem = Log(context: viewContext)
//            newItem.timeStamp = Date()
//        }
//        do {
//            try viewContext.save()
//        } catch {
//            // Replace this implementation with code to handle the error appropriately.
//            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//            let nsError = error as NSError
//            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//        }
        return result
    }()

    public let container: PersistentCloudKitContainer

    public init(inMemory: Bool = false) {
        container = persistentCloudKitContainer!
        print("Init persistenceController")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
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
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }
}
