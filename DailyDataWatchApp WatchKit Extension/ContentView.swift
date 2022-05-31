//  Created by Fede Duarte on 6/4/22.

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(fetchRequest: Flightdata.getFlightdata())
    private var flightdata: FetchedResults<Flightdata>
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
                Button("Delete all") { PersistentContainer.deleteBatch() }.padding(.top)
            }
            if flightdata.count == 0 { EmptyData() } // FE
        }.padding(.horizontal, 2) // SW
    }
}

struct ContentView_Previews: PreviewProvider {
    static var viewContext = PersistentContainer.persistentContainer.viewContext
    static var previews: some View {
        let s = Flightdata(context: viewContext)
        s.destination1 = "DUB"
        s.destination2 = "MAH"
        s.registration = "LOP  MAN"
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
        s.pax3 = "123"
        s.pax4 = "123"
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
        return ContentView()
            .environment(\.managedObjectContext, PersistentContainer.persistentContainer.viewContext)
            .previewDevice(PreviewDevice(rawValue: "Apple Watch Series 7 - 41mm"))
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

struct iWatchFlights: View {
    let flight: String
    let std: String
    let sta: String
    let pax: String
    var body: some View {
        HStack {
            Text(flight) // fl.flight1Name
            Spacer()
            Text(std) // fl.departure1Name
            Spacer()
            Text(sta) // fl.arrival1Name
            Spacer()
            Text(pax) // fl.pax1Name
        }
    }
}




/*
 VStack {
     HStack {
         Text(fl.destination1Name)
         Text("-").opacity(fl.destination2Name.isEmpty ? 0 : 1)
         Text(fl.destination2Name)
         Spacer()
     }
     HStack {
         Text("EC - ")
         Text(fl.registrationName)
         Spacer()
     }
 }
 -----
 VStack {
     if fl.destination2Name.isEmpty {
         HStack {
             Text(fl.flight1Name)
             Spacer()
             Text(fl.departure1Name)
             Spacer()
             Text(fl.arrival1Name)
             Spacer()
             Text(fl.pax1Name)
         }
         HStack {
             Text(fl.flight2Name)
             Spacer()
             Text(fl.departure2Name)
             Spacer()
             Text(fl.arrival2Name)
             Spacer()
             Text(fl.pax2Name)
         }
     } else {
         HStack {
             Text(fl.flight1Name)
             Spacer()
             Text(fl.departure1Name)
             Spacer()
             Text(fl.arrival1Name)
             Spacer()
             Text(fl.pax1Name)
         }
         HStack {
             Text(fl.flight2Name)
             Spacer()
             Text(fl.departure2Name)
             Spacer()
             Text(fl.arrival2Name)
             Spacer()
             Text(fl.pax2Name)
         }
         HStack {
             Text(fl.flight3Name)
             Spacer()
             Text(fl.departure3Name)
             Spacer()
             Text(fl.arrival3Name)
             Spacer()
             Text(fl.pax3Name)
         }
         HStack {
             Text(fl.flight4Name)
             Spacer()
             Text(fl.departure4Name)
             Spacer()
             Text(fl.arrival4Name)
             Spacer()
             Text(fl.pax4Name)
         }.disabled(fl.flight4Name.isEmpty)
     } // else
 } // VS
 ---
 HStack {
     VStack(alignment: .leading) {
         Text(fl.flightcrew1Name)
         Text(fl.flightcrew2Name)
         Text(fl.cabincrew2Name)
         Text(fl.cabincrew3Name)
         Text(fl.cabincrew4Name)
         Text(fl.cabincrew5Name)
     }.lineLimit(1)
     Spacer()
     VStack(alignment: .trailing) {
         Text(fl.flightcrew1Number)
         Text(fl.flightcrew2Number)
         Text(fl.crew2Number)
         Text(fl.crew3Number)
         Text(fl.crew4Number)
         Text(fl.crew5Number)
     }
 } // VS
 */
