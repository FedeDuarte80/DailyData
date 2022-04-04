import SwiftUI
import CoreData

struct ContentView: View {
    @State private var presentingSheet = false
    @FetchRequest(entity: Flightdata.entity(), sortDescriptors: []) var flightdata: FetchedResults<Flightdata>
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(flightdata) { fl in
                    HStack {
                        // MARK: - DESTINATION
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Destination:")
                            HStack {
                                Text(fl.destination1Name)
                                Text("  -  ")
                                Text(fl.destination2Name)
                            } // HS
                        } // VS
                        Spacer()
                        // MARK: - REGISTRATION
                        VStack(alignment: .leading, spacing: 10) {
                            Text("AC Registration: ")
                            HStack {
                                Text("EC - ")
                                Text(fl.registrationName)
                            } // HS
                        } // VS
                        Spacer()
                    } // HS
                    Divider().padding(.vertical, 5)
                    // MARK: - FLIGHTS
                    HStack(spacing: 35) {
                        VStack(spacing: 14) {
                            Text("Flight Nº")
                            VStack(spacing: 14) {
                                Text(fl.flight1Name)
                                Text(fl.flight2Name)
                                Text(fl.flight3Name)
                                Text(fl.flight4Name)
                            }.modifier(TextDetails())
                        } // VS
                        
                        VStack(spacing: 14) {
                            Text("ETD")
                            VStack(spacing: 14) {
                                Text(fl.departure1Name)
                                Text(fl.departure2Name)
                                Text(fl.departure3Name)
                                Text(fl.departure4Name)
                            }.modifier(TextDetails())
                        } // VS
                        
                        VStack(spacing: 14) {
                            Text("ETA")
                            VStack(spacing: 14) {
                                Text(fl.arrival1Name)
                                Text(fl.arrival2Name)
                                Text(fl.arrival3Name)
                                Text(fl.arrival4Name)
                            }.modifier(TextDetails())
                        } // VS
                        
                        VStack(spacing: 14) {
                            Text("PAX")
                            VStack(spacing: 14) {
                                Text(fl.pax1Name)
                                Text(fl.pax2Name)
                                Text(fl.pax3Name)
                                Text(fl.pax4Name)
                            }.modifier(TextDetails())
                        } // VS
                    } // HS
                    Divider().padding(.vertical, 5)
                    // MARK: - CREW
                    Text("CREW")
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            Text("C - ")
                            Text(fl.flightcrew1Name)
                            Spacer()
                        } // HS
                        
                        HStack {
                            Text("F - ")
                            Text(fl.flightcrew2Name)
                            Spacer()
                        } // HS
                        
                        HStack {
                            Text("2 - ")
                            Text(fl.cabincrew2Name)
                            Spacer()
                        } // HS
                        
                        HStack {
                            Text("3 - ")
                            Text(fl.cabincrew3Name)
                            Spacer()
                        } // HS
                        
                        HStack {
                            Text("4 - ")
                            Text(fl.cabincrew4Name)
                            Spacer()
                        } // HS
                        
                        HStack {
                            Text("5 - ")
                            Text(fl.cabincrew5Name)
                            Spacer()
                        } // HS
                    } // VS
                    .padding(.vertical, 5)
                    Spacer()
                } // FE
            }// SV
            .padding()
            .sheet(isPresented: $presentingSheet) { ModelView() }
            .navigationTitle("DailyData")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color("bg"))
            .onAppear {
                let appearance = UINavigationBarAppearance()
                appearance.backgroundColor = UIColor(Color("tb"))
                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) { PlusButton() }
            }
            
        }// NV
        .navigationViewStyle(.stack)
    }
    
    // MARK: - FUNCTIONS
    func PlusButton() -> some View {
        Button(action: { presentingSheet = true }) {
            Image(systemName: "plus")
        }
    }
}


// MARK: - MODIFIERS
struct TextDetails: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 65)
    }
}

// MARK: - PREVIEW
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistentContainer.persistentContainer.viewContext)
    }
}

/*
 static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
 static var previews: some View {
 let fl = Flightdata(context: moc)
 fl.destination1 = "MAD"
 fl.destination2 = "MAH"
 fl.registration = "JEQ"
 fl.flight1 = "1234"
 fl.departure1 = "1234"
 fl.arrival1 = "1234"
 fl.pax1 = "123"
 fl.flight2 = "1234"
 fl.departure2 = "1234"
 fl.arrival2 = "1234"
 fl.pax2 = "123"
 fl.flight3 = "1234"
 fl.departure3 = "1234"
 fl.arrival3 = "1234"
 fl.pax3 = "123"
 fl.flight4 = "1234"
 fl.departure4 = "1234"
 fl.arrival4 = "1234"
 fl.pax4 = "123"
 fl.flightcrew1 = "captain"
 fl.flightcrew2 = "firstofficer"
 fl.cabincrew2 = "cabincrew"
 fl.cabincrew3 = "cabincrew"
 fl.cabincrew4 = "cabincrew"
 fl.cabincrew5 = "cabincrew"
 
 return ContentView()
 .environment(\.managedObjectContext, PersistentContainer.persistentContainer.viewContext)
 
 }
 */
