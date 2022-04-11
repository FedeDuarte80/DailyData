//  Created by Fede Duarte on 6/4/22.

import SwiftUI
import CoreData

struct ContentView: View {
    @FetchRequest(fetchRequest: Flightdata.getFlightdata()) var flightdata: FetchedResults<Flightdata>
    var body: some View {
        ScrollView {
            ForEach(flightdata) { fl in
                // MARK: - Destination
                HStack {
                    Text(fl.destination1Name)
                    Text("-")
                    Text(fl.destination2Name)
                    Spacer()
                    Text("EC-")
                    Text(fl.registrationName)
                } // HS
                Divider()
                // MARK: - Fligths
                HStack {
                    Text(fl.flight1Name)
                    Text(fl.departure1Name)
                    Text(fl.arrival1Name)
                    Text(fl.pax1Name)
                } // HS
                HStack {
                    Text(fl.flight2Name)
                    Text(fl.departure2Name)
                    Text(fl.arrival2Name)
                    Text(fl.pax2Name)
                } // HS
                HStack {
                    Text(fl.flight3Name)
                    Text(fl.departure3Name)
                    Text(fl.arrival3Name)
                    Text(fl.pax3Name)
                } // HS
                HStack {
                    Text(fl.flight4Name)
                    Text(fl.departure4Name)
                    Text(fl.arrival4Name)
                    Text(fl.pax4Name)
                } // HS
                
                // MARK: - Crew
                Divider()
                VStack { // Needed due max 10 items
                    Text(fl.flightcrew1Name)
                    Text(fl.flightcrew2Name)
                    Text(fl.cabincrew2Name)
                    Text(fl.cabincrew3Name)
                    Text(fl.cabincrew4Name)
                    Text(fl.cabincrew5Name)
                } // VS
            } // FE
        } // SW
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
