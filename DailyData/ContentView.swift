import SwiftUI
import CoreData

struct ContentView: View {
    @FetchRequest(fetchRequest: Flightdata.getFlightdata()) var flightdata: FetchedResults<Flightdata>
    @Environment(\.managedObjectContext) var moc
    @State private var presentingSheet = false
    @State private var showingAlert = false
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(flightdata) { fl in
                    HStack {
                        DestinationView(dest1: fl.destination1Name, dest2: fl.destination2Name)
                        Spacer()
                        RegistrationView(reg1: fl.registrationName)
                        Spacer()
                    } // HS
                    Divider().padding(.vertical, 5)
                    HStack(spacing: 35) {
                        FlightView(Label: "Flight Nº", a: fl.flight1Name, b: fl.flight2Name, c: fl.flight3Name, d: fl.flight4Name)
                        FlightView(Label: "ETD", a: fl.departure1Name, b: fl.departure2Name, c: fl.departure3Name, d: fl.departure4Name)
                        FlightView(Label: "ETA", a: fl.arrival1Name, b: fl.arrival2Name, c: fl.arrival3Name, d: fl.arrival4Name)
                        FlightView(Label: "PAX", a: fl.pax1Name, b: fl.pax2Name, c: fl.pax3Name, d: fl.pax4Name)
                    } // HS
                    Divider().padding(.vertical, 5)
                    Text("CREW").modifier(Labels())
                    HStack {
                        VStack(alignment: .leading, spacing: 20) {
                            CrewView(function: "C - ", name: fl.flightcrew1Name, opa: 1)
                            CrewView(function: "F - ", name: fl.flightcrew2Name, opa: 1)
                            CrewView(function: "2 - ", name: fl.cabincrew2Name, opa: 1)
                            CrewView(function: "3 - ", name: fl.cabincrew3Name, opa: 1)
                            CrewView(function: "4 - ", name: fl.cabincrew4Name, opa: fl.cabincrew4Name.isEmpty ? 0 : 1)
                            CrewView(function: "5 - ", name: fl.cabincrew5Name, opa: fl.cabincrew5Name.isEmpty ? 0 : 1)
                        }.padding(.vertical, 5)
                        Spacer()
                    }
                    Spacer()
                } // FE
            }// SV
            .padding()
            .sheet(isPresented: $presentingSheet) { ModelView() }
            .navigationTitle("DailyData")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear { addTabColor() }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) { ClearButton() }
                ToolbarItem(placement: .navigationBarTrailing) { PlusButton() }
            }
            .confirmationDialog("Are you sure you want to delete all the data?", isPresented: $showingAlert, titleVisibility: .visible) {
                Button("DELETE ALL", role: .destructive) { PersistentContainer.deleteBatch() }
            }
        }.navigationViewStyle(.stack)
    }
// MARK: - FUNCTIONS
    func PlusButton() -> some View {
        Button(action: { presentingSheet = true }) {
            Image(systemName: "plus")
        }
    }
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
}

// MARK: - PREVIEW
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .environment(\.managedObjectContext, PersistentContainer.persistentContainer.viewContext)
    }
}


