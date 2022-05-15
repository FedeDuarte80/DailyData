//  Created by Fede Duarte on 10/5/22.
/*
 I have a watchOS extension that I'm trying to sync to their iPhone using CoreData and CloudKit, but it doesn't seem to want to sync.

 I've tried a few solutions (CloudKit + CoreData on iOS and watchOS sync not working, Core data + CloudKit - sharing between iOS and watchOS companion app), but it's still not syncing.

 Here's my shared (it's loading in both targets) persistence code:
 ----------------
 
 import CoreData
 
 struct PersistenceController {
     static let shared = PersistenceController()
     static var preview: PersistenceController = {
         let result = PersistenceController(inMemory: true)
         return result
     }()
     let container: NSPersistentCloudKitContainer
     init(inMemory: Bool = false) {
         container = NSPersistentCloudKitContainer(name: "My-app")
         if inMemory {
             container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
         }
         let description = container.persistentStoreDescriptions.first
         
         description?.cloudKitContainerOptions = NSPersistentCloudKitContainerOptions(containerIdentifier: "iCloud.com.mydomain.my-app")
         container.loadPersistentStores(completionHandler: { (storeDescription, error) in
             if let error = error as NSError? {
                 print("Unresolved error \(error), \(error.userInfo)")
             }
         })
         container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
         container.viewContext.automaticallyMergesChangesFromParent = true
     }
 }
 ----------------
 Should I have a different code for the watch? Right now both targets share all the files.

 Both targets share the same xcdatamodeld file. I used to have all the ManagedObject classes automatically generated (Codegen: Class Definition), but someone suggested manually generating them, but that didn't seem to change anything. Maybe the classes need to be different for each target (but what should be different)?

 Both targets have iCloud and background notifications enabled.

 I don't know if this matters, but I'm using SwiftUI. Here's the view model and the relevant code that loads the data (same file for both targets):
-------------
 
 import Foundation
 import CoreData
 import SwiftUI
 
 final class ProjectListViewModel : ObservableObject {
     private var viewContext : NSManagedObjectContext
     @Published var settings : Settings?
     @Published var coreDataHasError = false
     @Published var projects : [Project]
     
     init(viewContext : NSManagedObjectContext, settings : Settings? = nil) {
         self.projects = [Project]()
         self.viewContext = viewContext
         self.settings = settings
         if settings != nil {
             updateList()
         }
     }
     
     func updateList() {
         var orderBy : NSSortDescriptor = NSSortDescriptor(keyPath: \Project.dateModified, ascending: false)
         if settings != nil {
             switch settings!.orderBy {
             case Settings.OrderBy.dateCreated.rawValue:
                 orderBy = NSSortDescriptor(keyPath: \Project.dateCreated, ascending: false)
             case Settings.OrderBy.alphabetical.rawValue:
                 orderBy = NSSortDescriptor(keyPath: \Project.name, ascending: true)
             default:
                 orderBy = NSSortDescriptor(keyPath: \Project.dateModified, ascending: false)
             }
             
         }
         let request : NSFetchRequest<Project>  = Project.fetchRequest()
         request.predicate = NSPredicate(format: "status == %d", Project.ProjectStatus.active.rawValue)
         request.sortDescriptors = [orderBy]
         projects = try! viewContext.fetch(request)
     }
 }
 ----------------
 
 And the view (this one is only used by the watch):
 
 ----------------
 
 import SwiftUI
 import CoreData
 
 struct ProjectListView: View {
     @ObservedObject var viewModel : ProjectListViewModel
     @ObservedObject var settings : Settings
     @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
     @Environment(\.managedObjectContext) private var viewContext
     
     init(viewContext: NSManagedObjectContext, settings: Settings) {
         self.viewModel = ProjectListViewModel(viewContext: viewContext, settings: settings)
         self.settings = settings
     }
     var body: some View {
         if quickCountProject.count == 0 {
             viewModel.addScratchProject()
         }
         return
             ScrollView {
                 VStack {
                     if viewModel.projects.count >= 1 {
                     ZStack {
                         VStack {
                             Text(NSLocalizedString("Title", comment: "Page title"))
                                 .TitleStyle()
                             List {
                                 ForEach(viewModel.projects) { project in
                                     NavigationLink(destination:
                                                     ProjectView(project: project, settings: settings, viewModel: ProjectListViewModel(viewContext: viewContext), viewContext: viewContext)
                                                     .environmentObject(self.settings)
                                                     .environment(\.managedObjectContext, viewContext))
                                     {
                                         HStack {
                                             Image(systemName: "plus.app.fill").foregroundColor(.main).imageScale(.large)
                                             Text(project.name ?? "").font(.headline).padding(.bottom, 5).padding(.top, 5)
                                             
                                         }
                                         .accessibilityHint(Text(NSLocalizedString("View project details", comment: "")))
                                     }
                                 }
                                 .listRowBackground(Color.lightGray)
                                 .padding(0)
                             }
                             .frame(minHeight: (45 * CGFloat(viewModel.projects.count)))
                         }
                         .padding(0)
                     }
                     } else {
                         Text(NSLocalizedString("To start, add a new project on you phone or iPad. Or use the button below to do a quick count.", comment: ""))
                             .fixedSize(horizontal: false, vertical: true)
                     }
                 }
             }
             .onAppear(perform: {
                 viewModel.updateList()
             })
     }
 }

 ----------------
 */
