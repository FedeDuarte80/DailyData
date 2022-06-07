//  Created by Fede Duarte on 12/4/22.

import SwiftUI
import CoreData

struct ShowingView: View {
    @FetchRequest(fetchRequest: Flightdata.getFlightdata()) var flightdata: FetchedResults<Flightdata>
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ForEach(flightdata) { fl in
                    RegView(dest1: fl.destination1Name, dest2: fl.destination2Name, reg: fl.registrationName, opacity: fl.destination2Name.isEmpty ? 0 : 1)
                    Divider().padding(.vertical, 5)
                    VStack(spacing: 24) {
                        FlightsView(a: "Flights", b: "STD", c: "STA", d: "PAX").modifier(Labels())
                        if !fl.flight1Name.isEmpty {
                            FlightsView(a: fl.flight1Name, b: fl.departure1Name, c: fl.arrival1Name, d: fl.pax1Name)
                        } else { EmptyView() }
                        if !fl.flight2Name.isEmpty {
                            FlightsView(a: fl.flight2Name, b: fl.departure2Name, c: fl.arrival2Name, d: fl.pax2Name)
                        } else { EmptyView() }
                        if !fl.flight3Name.isEmpty {
                            FlightsView(a: fl.flight3Name, b: fl.departure3Name, c: fl.arrival3Name, d: fl.pax3Name)
                        } else { EmptyView() }
                        if !fl.flight4Name.isEmpty {
                            FlightsView(a: fl.flight4Name, b: fl.departure4Name, c: fl.arrival4Name, d: fl.pax4Name)
                        } else { EmptyView() }
                    }
                    Divider().padding(.vertical, 5)
                    
                    VStack(alignment: .leading, spacing: 34) {
                        if !fl.flightcrew1Name.isEmpty {
                            CrewView(function: "C - ", name: fl.flightcrew1Name, staff: fl.flightcrew1Number)
                        } else { EmptyView() }
                        if !fl.flightcrew2Name.isEmpty {
                            CrewView(function: "F - ", name: fl.flightcrew2Name, staff: fl.flightcrew2Number)
                        } else { EmptyView() }
                        if !fl.cabincrew2Name.isEmpty {
                            CrewView(function: "2 - ", name: fl.cabincrew2Name, staff: fl.crew2Number)
                        } else { EmptyView() }
                        if !fl.cabincrew3Name.isEmpty {
                            CrewView(function: "3 - ", name: fl.cabincrew3Name, staff: fl.crew3Number)
                        } else { EmptyView() }
                        if !fl.cabincrew4Name.isEmpty {
                            CrewView(function: "4 - ", name: fl.cabincrew4Name, staff: fl.crew4Number)
                        } else { EmptyView() }
                        if !fl.cabincrew5Name.isEmpty {
                            CrewView(function: "5 - ", name: fl.cabincrew5Name, staff: fl.crew5Number)
                        } else { EmptyView() }
                    }.padding(.vertical, 5)
                    Spacer()
                } // FE
            }// SV
            .padding()
            .navigationTitle("DailyData")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear { addTabColor() }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) { ClearButton() }
                ToolbarItem(placement: .navigationBarTrailing) { addSeedData() }
            }
            .confirmationDialog("Are you sure you want to delete all the data?", isPresented: $showingAlert, titleVisibility: .visible) {
                Button("Delete All", role: .destructive) { PersistentContainer.deleteBatch() }
            }
        }.navigationViewStyle(.stack)
    }
    // MARK: - FUNCTIONS
    func ClearButton() -> some View {
        Button(action: { showingAlert.toggle() }) {
            Text("Clear").disabled(flightdata.isEmpty)
        }
    }
    func addTabColor() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(Color("tb"))
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    func addSeedData() -> some View {
        Button(action: {
            Flightdata.loadSeedData(into: PersistentContainer.persistentContainer.viewContext)
        }) { Text("SeedData").disabled(!flightdata.isEmpty) } // Test
    }
}

struct ShowingView_Previews: PreviewProvider {
    static var viewContext = PersistentContainer.persistentContainer.viewContext
    static var previews: some View {
        let s = Flightdata(context: viewContext)
        s.destination1 = "DUB"
        s.destination2 = "MAH"
        s.registration = "LOP - MAN"
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
        return ShowingView() .environment(\.managedObjectContext, PersistentContainer.persistentContainer.viewContext)
            .preferredColorScheme(.dark)
        
    }
}
/*
 
 if fl.flight2Name.isEmpty && fl.flight3Name.isEmpty && fl.flight4Name.isEmpty {
 FlightsView(a: fl.flight1Name, b: fl.departure1Name, c: fl.arrival1Name, d: fl.pax1Name)
 } else if fl.flight3Name.isEmpty && fl.flight4Name.isEmpty {
 FlightsView(a: fl.flight1Name, b: fl.departure1Name, c: fl.arrival1Name, d: fl.pax1Name)
 FlightsView(a: fl.flight2Name, b: fl.departure2Name, c: fl.arrival2Name, d: fl.pax2Name)
 } else if fl.flight4Name.isEmpty {
 FlightsView(a: fl.flight1Name, b: fl.departure1Name, c: fl.arrival1Name, d: fl.pax1Name)
 FlightsView(a: fl.flight2Name, b: fl.departure2Name, c: fl.arrival2Name, d: fl.pax2Name)
 FlightsView(a: fl.flight3Name, b: fl.departure3Name, c: fl.arrival3Name, d: fl.pax3Name)
 } else {
 FlightsView(a: fl.flight1Name, b: fl.departure1Name, c: fl.arrival1Name, d: fl.pax1Name)
 FlightsView(a: fl.flight2Name, b: fl.departure2Name, c: fl.arrival2Name, d: fl.pax2Name)
 FlightsView(a: fl.flight3Name, b: fl.departure3Name, c: fl.arrival3Name, d: fl.pax3Name)
 FlightsView(a: fl.flight4Name, b: fl.departure4Name, c: fl.arrival4Name, d: fl.pax4Name)
 }
 
 if fl.cabincrew4Name.isEmpty && fl.cabincrew5Name.isEmpty {
 CrewView(function: "C - ", name: fl.flightcrew1Name, staff: fl.flightcrew1Number)
 CrewView(function: "F - ", name: fl.flightcrew2Name, staff: fl.flightcrew2Number)
 CrewView(function: "2 - ", name: fl.cabincrew2Name, staff: fl.crew2Number)
 CrewView(function: "3 - ", name: fl.cabincrew3Name, staff: fl.crew3Number)
 } else if fl.cabincrew5Name.isEmpty {
 CrewView(function: "C - ", name: fl.flightcrew1Name, staff: fl.flightcrew1Number)
 CrewView(function: "F - ", name: fl.flightcrew2Name, staff: fl.flightcrew2Number)
 CrewView(function: "2 - ", name: fl.cabincrew2Name, staff: fl.crew2Number)
 CrewView(function: "3 - ", name: fl.cabincrew3Name, staff: fl.crew3Number)
 CrewView(function: "4 - ", name: fl.cabincrew4Name, staff: fl.crew4Number)
 } else {
 CrewView(function: "C - ", name: fl.flightcrew1Name, staff: fl.flightcrew1Number)
 CrewView(function: "F - ", name: fl.flightcrew2Name, staff: fl.flightcrew2Number)
 CrewView(function: "2 - ", name: fl.cabincrew2Name, staff: fl.crew2Number)
 CrewView(function: "3 - ", name: fl.cabincrew3Name, staff: fl.crew3Number)
 CrewView(function: "4 - ", name: fl.cabincrew4Name, staff: fl.crew4Number)
 CrewView(function: "5 - ", name: fl.cabincrew5Name, staff: fl.crew5Number)
 }
 
 HStack {
 DestinationView(dest1: fl.destination1Name, dest2: fl.destination2Name)
 Spacer()
 RegistrationView(reg1: fl.registrationName)
 Spacer()
 } // HS
 ------
 HStack(spacing: 35) {
 FlightView(Label: "Flight Nº", a: fl.flight1Name, b: fl.flight2Name, c: fl.flight3Name, d: fl.flight4Name)
 FlightView(Label: "ETD", a: fl.departure1Name, b: fl.departure2Name, c: fl.departure3Name, d: fl.departure4Name)
 FlightView(Label: "ETA", a: fl.arrival1Name, b: fl.arrival2Name, c: fl.arrival3Name, d: fl.arrival4Name)
 FlightView(Label: "PAX", a: fl.pax1Name, b: fl.pax2Name, c: fl.pax3Name, d: fl.pax4Name)
 } // HS
 */
