import SwiftUI

@main
struct DailyDataApp: App {
    let context = PersistentContainer.persistentContainer.viewContext
    var body: some Scene {
        WindowGroup {
           // ContentView()
            MainView()
                .environment(\.managedObjectContext, context)
        }
    }
}
