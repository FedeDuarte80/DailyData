//  Created by Fede Duarte on 20/5/22.

import SwiftUI

struct MainView: View {
    var body: some View {
        ContentView()
    }
}

struct MainView_Previews: PreviewProvider {
    static var viewContext = PersistentContainer.persistentContainer.viewContext
    static var previews: some View {
        let s = Flightdata(context: viewContext)
        s.destination1 = "DUB"
        s.destination2 = "MAH"
        s.registration = "LOP"
        s.flight1 = "1234"
        s.flight2 = "1234"
        s.flight3 = "1234"
        s.flight4 = "1234"
        s.departure1 = "1234"
        s.departure2 = "1234"
        s.departure3 = "1234"
        s.departure4 = "1234"
        s.arrival1 = "1234"
        s.arrival2 = "1234"
        s.arrival3 = "1234"
        s.arrival4 = "1234"
        s.pax1 = "123"
        s.pax2 = "123"
        s.pax3 = "12"
        s.pax4 = ""
        s.flightcrew1 = "QWERTY"
        s.flightNumber1 = "12345"
        s.flightcrew2 = "QWERTY"
        s.flightNumber2 = "12345"
        s.cabincrew2 = "QWERTY"
        s.crewNumber2 = "13245"
        s.cabincrew3 = "QWERTY"
        s.crewNumber3 = "13245"
        s.cabincrew4 = "QWERTY"
        s.crewNumber4 = "13245"
        s.cabincrew5 = "QWERTY"
        s.crewNumber5 = "13245"
        return Group {
            MainView()
                .environment(\.managedObjectContext, PersistentContainer.persistentContainer.viewContext)
            
            MainView()
                .environment(\.managedObjectContext, PersistentContainer.persistentContainer.viewContext)
                .previewDevice(PreviewDevice(rawValue: "Apple Watch Series 5 - 40mm"))
        }
    }
}

/*
 EmptyData()
 iWatchFlights(flight: "1234", std: "1234", sta: "1234", pax: "123")
 */
