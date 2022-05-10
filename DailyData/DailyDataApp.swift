import SwiftUI

@main
struct DailyDataApp: App {
    let context = PersistentContainer.persistentContainer.viewContext
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    var body: some Scene {
        WindowGroup {
           // ContentView()
            MainView()
                .environment(\.managedObjectContext, context)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
