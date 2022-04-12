import SwiftUI

struct MainView: View {
    @State private var selected = 1
    var body: some View {
        TabView(selection: $selected) {
            InsertView().tabItem {
                Label("Insert", systemImage: "rectangle.and.hand.point.up.left.filled")
            }.tag(0)
            
            ShowingView().tabItem {
                Label("Showing", systemImage: "app.badge.checkmark")
            }.tag(1)
            SettingsView().tabItem {
                Label("Settings", systemImage: "hammer.circle.fill")
            }
        } // TV
        .accentColor(Color("AccentColor"))
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.backgroundColor = UIColor(Color("tb"))
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
//            MainView().preferredColorScheme(.dark)
        }
//        .padding()
//        .frame(height: 80)
//        .previewLayout(.sizeThatFits)
    }
}
