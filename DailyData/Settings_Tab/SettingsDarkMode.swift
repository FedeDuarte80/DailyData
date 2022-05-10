import SwiftUI

struct SettingsDarkMode: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    var body: some View {
        Section(header: Text("APP THEME")) {
            Toggle(isOn: $isDarkMode, label: {
                Image(systemName: "moon.circle")
                Text("Dark Mode")
                    .font(.headline)
                    .font(Font.system(size: 20, design: .serif))
                    .foregroundColor(.primary)
            })
        }
    }
}

struct SettingsDarkMode_Previews: PreviewProvider {
    static var previews: some View {
        SettingsDarkMode()
    }
}
