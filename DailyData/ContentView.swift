import SwiftUI
import CoreData

struct ContentView: View {
//    @FetchRequest(entity: Flightdata.entity(), sortDescriptors: []) var flightdata: FetchedResults<Flightdata>
    
    @FetchRequest(fetchRequest: Flightdata.getFlightdata()) var flightdata: FetchedResults<Flightdata>
    @State private var presentingSheet = false
    @State private var showingAlert = false
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(flightdata) { fl in
                    HStack {
                        // MARK: - DESTINATION
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Destination:").modifier(Labels())
                            HStack {
                                Text(fl.destination1Name)
                                Text("  -  ")
                                Text(fl.destination2Name)
                            } // HS
                        } // VS
                        Spacer()
                        // MARK: - REGISTRATION
                        VStack(alignment: .leading, spacing: 10) {
                            Text("AC Registration: ").modifier(Labels())
                            HStack {
                                Text("EC - ").modifier(Labels())
                                Text(fl.registrationName)
                            } // HS
                        } // VS
                        Spacer()
                    } // HS
                    Divider().padding(.vertical, 5)
                    // MARK: - FLIGHTS
                    HStack(spacing: 35) {
                        VStack(spacing: 14) {
                            Text("Flight Nº").modifier(Labels())
                            VStack(spacing: 14) {
                                Text(fl.flight1Name)
                                Text(fl.flight2Name)
                                Text(fl.flight3Name)
                                Text(fl.flight4Name)
                            }.modifier(TextDetails())
                        } // VS
                        
                        VStack(spacing: 14) {
                            Text("ETD").modifier(Labels())
                            VStack(spacing: 14) {
                                Text(fl.departure1Name)
                                Text(fl.departure2Name)
                                Text(fl.departure3Name)
                                Text(fl.departure4Name)
                            }.modifier(TextDetails())
                        } // VS
                        
                        VStack(spacing: 14) {
                            Text("ETA").modifier(Labels())
                            VStack(spacing: 14) {
                                Text(fl.arrival1Name)
                                Text(fl.arrival2Name)
                                Text(fl.arrival3Name)
                                Text(fl.arrival4Name)
                            }.modifier(TextDetails())
                        } // VS
                        
                        VStack(spacing: 14) {
                            Text("PAX").modifier(Labels())
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
                    Text("CREW").modifier(Labels())
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            Text("C - ").modifier(Labels())
                            Text(fl.flightcrew1Name)
                            Spacer()
                        } // HS
                        
                        HStack {
                            Text("F - ").modifier(Labels())
                            Text(fl.flightcrew2Name)
                            Spacer()
                        } // HS
                        
                        HStack {
                            Text("2 - ").modifier(Labels())
                            Text(fl.cabincrew2Name)
                            Spacer()
                        } // HS
                        
                        HStack {
                            Text("3 - ").modifier(Labels())
                            Text(fl.cabincrew3Name)
                            Spacer()
                        } // HS
                        
                        HStack {
                            Text("4 - ").modifier(Labels())
                                .opacity(fl.cabincrew4Name.isEmpty ? 0 : 1)
                            Text(fl.cabincrew4Name)
                            Spacer()
                        } // HS
                        
                        HStack {
                            Text("5 - ").modifier(Labels())
                                .opacity(fl.cabincrew5Name.isEmpty ? 0 : 1)
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
            .onAppear {
                let appearance = UINavigationBarAppearance()
                appearance.backgroundColor = UIColor(Color("tb"))
                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { showingAlert.toggle() } label: { Text("Clear") }.disabled(flightdata.isEmpty)
                }
                ToolbarItem(placement: .navigationBarTrailing) { PlusButton() }
            }
            .confirmationDialog("Are you sure you want to delete all the data?", isPresented: $showingAlert, titleVisibility: .visible) {
                Button("DELETE ALL", role: .destructive) { PersistentContainer.deleteBatch() }
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

