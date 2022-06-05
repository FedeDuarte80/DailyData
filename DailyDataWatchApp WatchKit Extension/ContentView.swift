//  Created by Fede Duarte on 6/4/22.

import SwiftUI
import CoreData


struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(fetchRequest: Flightdata.getFlightdata())
    private var flightdata: FetchedResults<Flightdata>
    @State private var showingAlert = false
    var body: some View {
        
        ScrollView {
            ForEach(flightdata) { fl in
// MARK: - Destination
                iWatchDestination(dest1: fl.destination1Name, dest2: fl.destination2Name, reg: fl.registrationName)
                Divider()
// MARK: - Fligths
                VStack {
                    if fl.flight2Name.isEmpty && fl.flight3Name.isEmpty && fl.flight4Name.isEmpty {
                        iWatchFlights(flight: fl.flight1Name, std: fl.departure1Name, sta: fl.arrival1Name, pax: fl.pax1Name)
                    } else if fl.flight3Name.isEmpty && fl.flight4Name.isEmpty {
                        iWatchFlights(flight: fl.flight1Name, std: fl.departure1Name, sta: fl.arrival1Name, pax: fl.pax1Name)
                        iWatchFlights(flight: fl.flight2Name, std: fl.departure2Name, sta: fl.arrival2Name, pax: fl.pax2Name)
                    } else if fl.flight4Name.isEmpty {
                        iWatchFlights(flight: fl.flight1Name, std: fl.departure1Name, sta: fl.arrival1Name, pax: fl.pax1Name)
                        iWatchFlights(flight: fl.flight2Name, std: fl.departure2Name, sta: fl.arrival2Name, pax: fl.pax2Name)
                        iWatchFlights(flight: fl.flight3Name, std: fl.departure3Name, sta: fl.arrival3Name, pax: fl.pax3Name)
                    } else {
                        iWatchFlights(flight: fl.flight1Name, std: fl.departure1Name, sta: fl.arrival1Name, pax: fl.pax1Name)
                        iWatchFlights(flight: fl.flight2Name, std: fl.departure2Name, sta: fl.arrival2Name, pax: fl.pax2Name)
                        iWatchFlights(flight: fl.flight3Name, std: fl.departure3Name, sta: fl.arrival3Name, pax: fl.pax3Name)
                        iWatchFlights(flight: fl.flight4Name, std: fl.departure4Name, sta: fl.arrival4Name, pax: fl.pax4Name)
                            
                    }
                }
                Divider()
// MARK: - Crew
                VStack {
                    if fl.cabincrew4Name.isEmpty && fl.cabincrew5Name.isEmpty {
                        iWatchCrew(crew: fl.flightcrew1Name, num: fl.flightcrew1Number)
                        iWatchCrew(crew: fl.flightcrew2Name, num: fl.flightcrew2Number)
                        iWatchCrew(crew: fl.cabincrew2Name, num: fl.crew2Number)
                        iWatchCrew(crew: fl.cabincrew3Name, num: fl.crew3Number)
                    } else if fl.cabincrew5Name.isEmpty {
                        iWatchCrew(crew: fl.flightcrew1Name, num: fl.flightcrew1Number)
                        iWatchCrew(crew: fl.flightcrew2Name, num: fl.flightcrew2Number)
                        iWatchCrew(crew: fl.cabincrew2Name, num: fl.crew2Number)
                        iWatchCrew(crew: fl.cabincrew3Name, num: fl.crew3Number)
                        iWatchCrew(crew: fl.cabincrew4Name, num: fl.crew4Number)
                    } else {
                        iWatchCrew(crew: fl.flightcrew1Name, num: fl.flightcrew1Number)
                        iWatchCrew(crew: fl.flightcrew2Name, num: fl.flightcrew2Number)
                        iWatchCrew(crew: fl.cabincrew2Name, num: fl.crew2Number)
                        iWatchCrew(crew: fl.cabincrew3Name, num: fl.crew3Number)
                        iWatchCrew(crew: fl.cabincrew4Name, num: fl.crew4Number)
                        iWatchCrew(crew: fl.cabincrew5Name, num: fl.crew5Number)
                    }
                }.lineLimit(1)
                clearButton().padding(.top)
            }
            if flightdata.count == 0 { EmptyData() } // FE
        }
        .padding(.horizontal, 2) // SW
        .navigationTitle("DailyData")
        .navigationBarTitleDisplayMode(.inline)
        .confirmationDialog("Are you sure you want to delete all the data?", isPresented: $showingAlert, titleVisibility: .visible) {
            Button("Delete all", role: .destructive) {
                PersistentContainer.deleteBatch()
                
            }
        }
    }
    func clearButton() -> some View {
        Button(action: { showingAlert.toggle() }) { Text("Delete all") }
    }

}


struct iWatchDestination: View {
    let dest1: String
    let dest2: String
    let reg: String
    var body: some View {
        VStack {
            HStack {
                Text(dest1)
                Text("-").opacity(dest2.isEmpty ? 0 : 1)
                Text(dest2)
                Spacer()
            }
            HStack {
                Text("EC - ")
                Text(reg)
                Spacer()
            }
        }
    }
}
struct iWatchFlights: View {
    let flight: String
    let std: String
    let sta: String
    let pax: String
    let w: CGFloat = 40
    var body: some View {
        HStack {
            Text(flight).frame(width: w)
            Spacer()
            Text(std).frame(width: w)
            Spacer()
            Text(sta).frame(width: w)
            Spacer()
            Text(pax).frame(width: 32)
        }
    }
}
struct iWatchCrew: View {
    let crew: String
    let num: String
    var body: some View {
        HStack {
            Text(crew)
            Spacer()
            Text(num)
        }
    }
}
