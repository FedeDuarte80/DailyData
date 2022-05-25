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
                HStack {
                    HStack {
                        Text(fl.destination1Name)
                        Text("-").opacity(fl.destination2Name.isEmpty ? 0 : 1)
                        Text(fl.destination2Name)
                    } // HS
                    Spacer()
                    HStack {
                        Text("EC - ").opacity(fl.registrationName.isEmpty ? 0 : 1)
                        Text(fl.registrationName)
                    } // HS
                } // HS
                Divider()
// MARK: - Fligths
                VStack {
                    if fl.destination2Name.isEmpty {
                        HStack {
                            Text(fl.flight1Name)
                            Spacer()
                            Text(fl.departure1Name)
                            Spacer()
                            Text(fl.arrival1Name)
//                            Spacer()
//                            Text(fl.pax1Name)
                        }
                        HStack {
                            Text(fl.flight2Name)
                            Spacer()
                            Text(fl.departure2Name)
                            Spacer()
                            Text(fl.arrival2Name)
//                            Spacer()
//                            Text(fl.pax2Name)
                        }
                    } else {
                        HStack {
                            Text(fl.flight1Name)
                            Spacer()
                            Text(fl.departure1Name)
                            Spacer()
                            Text(fl.arrival1Name)
//                            Spacer()
//                            Text(fl.pax1Name)
                        }
                        HStack {
                            Text(fl.flight2Name)
                            Spacer()
                            Text(fl.departure2Name)
                            Spacer()
                            Text(fl.arrival2Name)
//                            Spacer()
//                            Text(fl.pax2Name)
                        }
                        HStack {
                            Text(fl.flight3Name)
                            Spacer()
                            Text(fl.departure3Name)
                            Spacer()
                            Text(fl.arrival3Name)
//                            Spacer()
//                            Text(fl.pax3Name)
                        }
                        HStack {
                            Text(fl.flight4Name)
                            Spacer()
                            Text(fl.departure4Name)
                            Spacer()
                            Text(fl.arrival4Name)
//                            Spacer()
//                            Text(fl.pax4Name)
                        }
                    } // else
                } // VS
// MARK: - Crew
                Divider()
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
            } // FE
        } // SW
        .padding(.horizontal, 2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return ContentView()
           //98 .previewDevice(PreviewDevice(rawValue: "Apple Watch Series 5 - 44mm"))
    }
}

/*
 HStack {
     VStack {
         Text(fl.flight1Name)
         Text(fl.flight2Name)
         Text(fl.flight3Name)
         Text(fl.flight4Name)
     }
     Spacer()
     VStack {
         Text(fl.departure1Name)
         Text(fl.departure2Name)
         Text(fl.departure3Name)
         Text(fl.departure4Name)
     }
     Spacer()
     VStack {
         Text(fl.arrival1Name)
         Text(fl.arrival2Name)
         Text(fl.arrival3Name)
         Text(fl.arrival4Name)
     }
     Spacer()
     VStack {
         Text(fl.pax1Name)
         Text(fl.pax2Name)
         Text(fl.pax3Name)
         Text(fl.pax4Name)
     }
 } // HS
 */
