import CoreData

public class PersistentContainer {
    
// MARK: - Define Constants / Variables
    public static var context: NSManagedObjectContext {
            return persistentContainer.viewContext
    }
    
    
// MARK: - Initializer
    private init() {}
    
// MARK: - Core Data stack
    public static var persistentContainer: NSPersistentCloudKitContainer = {
            
        let container = NSPersistentCloudKitContainer(name: "CoreDataModel") // CDModel

        
        
        guard let description = container.persistentStoreDescriptions.first else {
            fatalError("No description found")
        }
        description.setOption(true as NSObject, forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)
        // https://www.youtube.com/watch?v=TsfOYHbf4Ew
        
        description.cloudKitContainerOptions = NSPersistentCloudKitContainerOptions(containerIdentifier: "iCloud.fededuarte.dailydata")
 //      description.setOption(true as NSNumber, forKey: NSPersistentHistoryTrackingKey)
 //       description.setOption(true as NSNumber, forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)
        
        
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                    if let error = error as NSError? {
                            fatalError("Unresolved error \(error), \(error.userInfo)")
                    }
            })
            container.viewContext.automaticallyMergesChangesFromParent = true
            container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
            return container
    }()
    
// MARK: - Core Data Saving support
    public static func saveContext () {
            let context = persistentContainer.viewContext
            if context.hasChanges {
                    do {
                            try context.save()
                    } catch {
                            let nserror = error as NSError
                            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                    }
            }
    }
    @objc
    func processUpdate(notificacion: NSNotification) {
        operationQueue.addOperation {
            
        }
    }
    
    lazy var operationQueue: OperationQueue = {
        var queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        return queue
    }()
    
    
    
    static func deleteBatch() {
        print("deleteBatch Called")
        let fetchRequest: NSFetchRequest<NSFetchRequestResult>
        fetchRequest = NSFetchRequest(entityName: "Flightdata")
        
        let deleteRequest = NSBatchDeleteRequest(
            fetchRequest: fetchRequest
        )
        deleteRequest.resultType = .resultTypeObjectIDs
        
        let context = persistentContainer.viewContext
        print("context created")
        
        let batchDelete = try? context.execute(deleteRequest) as? NSBatchDeleteResult
        print("batch deleted")
        
        guard let deleteResult = batchDelete?.result
                as? [NSManagedObjectID]
        else { return }
        
        let deletedObjects: [AnyHashable: Any] = [ NSDeletedObjectsKey: deleteResult]
        
        NSManagedObjectContext.mergeChanges(fromRemoteContextSave: deletedObjects, into: [context])
        print("data merged")
    }
}

// TEST

//extension NSPersistentContainer {
//
//    /// Called when a certain managed object context has been saved from an external process. It should also be called on the context's queue.
//    func viewContextDidSaveExternally() {
//        // `refreshAllObjects` only refreshes objects from which the cache is invalid. With a staleness intervall of -1 the cache never invalidates.
//        // We set the `stalenessInterval` to 0 to make sure that changes in the app extension get processed correctly.
//        viewContext.stalenessInterval = 0
//        viewContext.refreshAllObjects()
//        viewContext.stalenessInterval = -1
//        
//        print("viewContextDidSaveExternally")
//    }
//}
//
class NSCustomPersistentContainer: NSPersistentContainer {
    
    override open class func defaultDirectoryURL() -> URL {
        var storeURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.fededuarte.dailydata")
        storeURL = storeURL?.appendingPathComponent("group.fededuarte.dailydata")
        print("defaultDirectoryURL")
        return storeURL!
    }
}
