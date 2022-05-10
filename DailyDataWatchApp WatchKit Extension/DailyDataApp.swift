//  Created by Fede Duarte on 6/4/22.
import SwiftUI

@main
struct DailyDataApp: App {
    let context = PersistentContainer.persistentContainer.viewContext
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                //TestView()
                ContentView()
                    .environment(\.managedObjectContext, context)
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
