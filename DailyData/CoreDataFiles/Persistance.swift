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
            let container = NSPersistentCloudKitContainer(name: "CoreDataModel") // CDModel   name
            
        guard let description = container.persistentStoreDescriptions.first else {
            fatalError("No description found")
        }
        description.setOption(true as NSObject, forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)
        // https://www.youtube.com/watch?v=TsfOYHbf4Ew
        
        
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                    if let error = error as NSError? {
                            fatalError("Unresolved error \(error), \(error.userInfo)")
                    }
            })
            container.viewContext.automaticallyMergesChangesFromParent = true
            container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
//        NotificationCenter.default.addObserver(self, selector: #selector(self.processUpdate), name: .NSPersistentStoreRemoteChange, object: nil)
        
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


//    static func deleteAll() {
//        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Flightdata")
//        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//
//        do {
//            try moc.execute(deleteRequest, with: persistentContainer.viewContext)
//        } catch let error as NSError {
//            // TODO: handle the error
//        }
//    }
