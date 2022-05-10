import SwiftUI
import CoreData

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Form {
                LogoView()
                SettingsDarkMode()
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct LogoView: View {
    var body: some View {
        Section(header: Text("APP INFORMATION")) {
            Image("applogo")
                .padding(.vertical)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            Text("Version 1.0")
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        }
    }
}



// MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {

    static var previews: some View {
        SettingsView()//.preferredColorScheme(.dark)
    }
}

