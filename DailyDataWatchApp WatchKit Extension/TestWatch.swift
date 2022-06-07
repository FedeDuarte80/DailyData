import SwiftUI

struct TestWatch: View {
    var body: some View {
        VStack {
            iWatchFlights(flight: "fbf", std: "weg", sta: "gew", pax: "gwe")
            
            iWatchFlights(flight: "", std: "", sta: "", pax: "")
            
            iWatchFlights(flight: "", std: "", sta: "", pax: "")
            
            iWatchFlights(flight: "", std: "", sta: "", pax: "")
        }
    }
}

struct TestWatch_Previews: PreviewProvider {
    static var previews: some View {
        TestWatch()
    }
}
