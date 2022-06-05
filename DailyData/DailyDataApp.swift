import SwiftUI

@main
struct DailyDataApp: App {
    let context = PersistentContainer.persistentContainer.viewContext
    
    var body: some Scene {
        WindowGroup {
            MainView()
            
                .environment(\.managedObjectContext, context)
                .preferredColorScheme(.dark)
        }
    }
}
