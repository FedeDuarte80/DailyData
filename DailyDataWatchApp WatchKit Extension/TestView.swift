
import SwiftUI

struct TestView: View {
    var body: some View {
        ScrollView {
            HStack {
                Text("ZRH")
                Text("-")
                Text("AGP")
                Spacer()
                Text("EC-")
                Text("JSY")
            }
            Divider()
            
            HStack(spacing: 10) {
                Text("1234")
                Text("5678")
                Text("9023")
                Text("456")
            }
            
            HStack(spacing: 10) {
                Text("1234")
                Text("5678")
                Text("9023")
                Text("456")
            }
            
            HStack(spacing: 10) {
                Text("1234")
                Text("5678")
                Text("9023")
                Text("456")
            }
            
            HStack(spacing: 10) {
                Text("1234")
                Text("5678")
                Text("9023")
                Text("456")
            }
            
            Divider()
            
            
            HStack {
                VStack(alignment: .leading) {
                    Text("1234 Captain")
                    Text("1234 First Officer")
                    Text("1234 Number 2")
                    Text("1234 Number 3")
                    Text("1234 Number 4")
                    Text("1234 Number 4B")
                }
                Spacer()
            }
        }.padding(.horizontal, 2)
    }
}


// MARK: - Preview
struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
