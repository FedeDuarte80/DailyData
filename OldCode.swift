//  Created by Fede Duarte on 12/4/22.
//

/*
 CONTENT-VIEW HAD A PLUS BUTTON THAT SHOWED THE MODEL-VIEW MODAL
 
 ------ CONTENVIEW
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
 struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
         ContentView()
             .preferredColorScheme(.dark)
             .environment(\.managedObjectContext, PersistentContainer.persistentContainer.viewContext)
     }
 }
 
 ------ MODELVIEW
 
 import SwiftUI
 import CoreData

 struct ModelView: View {
     @Environment(\.dismiss) var dismiss
     @Environment(\.managedObjectContext) var moc
     @State var lastSubmit: String = "None"
     @FocusState var focus: OrderField?
     enum OrderField: Int, Hashable, CaseIterable {
         case destination1
         case destination2
         case registration
         case flight1
         case departure1
         case arrival1
         case pax1
         case flight2
         case departure2
         case arrival2
         case pax2
         case flight3
         case departure3
         case arrival3
         case pax3
         case flight4
         case departure4
         case arrival4
         case pax4
         case flightcrew1
         case flightcrew2
         case cabincrew2
         case cabincrew3
         case cabincrew4
         case cabincrew5
         
         func next() -> OrderField? {
             let all = Self.allCases
             let idx = all.firstIndex(of: self)!
             let next = all.index(after: idx)
             if next == all.endIndex {
                 return nil
             } else {
                 return all[next]
             }
         }
         func previous() -> OrderField? {
             let all = Self.allCases
             let idx = all.firstIndex(of: self)!
             let previous = all.index(before: idx)
             if previous < 0 {
                 return nil
             } else {
                 return all[previous]
             }
         }
     }
     
     @State private var destination1 = ""
     @State private var destination2 = ""
     @State private var registration = ""
     @State private var flight1 = ""
     @State private var flight2 = ""
     @State private var flight3 = ""
     @State private var flight4 = ""
     @State private var departure1 = ""
     @State private var departure2 = ""
     @State private var departure3 = ""
     @State private var departure4 = ""
     @State private var arrival1 = ""
     @State private var arrival2 = ""
     @State private var arrival3 = ""
     @State private var arrival4 = ""
     @State private var pax1 = ""
     @State private var pax2 = ""
     @State private var pax3 = ""
     @State private var pax4 = ""
     @State private var flightcrew1 = ""
     @State private var flightcrew2 = ""
     @State private var cabincrew2 = ""
     @State private var cabincrew3 = ""
     @State private var cabincrew4 = ""
     @State private var cabincrew5 = ""
     
     
 // MARK: - BODY
     var body: some View {
         NavigationView {
             ScrollView {
                 HStack {
 // MARK: - DESTINATION
                     VStack(alignment: .leading) {
                         LabelView(label: "Destionation: ")
                         HStack {
                             TextField("ZRH", text: $destination1).modifier(DayDetails())
                                 .onSubmit { lastSubmit = destination1
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .destination1)
                                 .limitInputLength(value: $destination1, length: 3)
                             LabelView(label: "-")
                             TextField("AGP", text: $destination2).modifier(DayDetails())
                                 .onSubmit { lastSubmit = destination2
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .destination2)
                                 .limitInputLength(value: $destination2, length: 3)
                         } // HS
                     } // VS
                     Spacer()
 // MARK: - REGISTRATION
                     VStack(alignment: .leading) {
                         LabelView(label: "AC Registration: ")
                         HStack {
                             Text("EC - ").modifier(Labels())
                             TextField("JSY", text: $registration).modifier(DayDetails())
                                 .onSubmit { lastSubmit = registration
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .registration)
                                 .limitInputLength(value: $registration, length: 3)
                         } // HS
                     } // VS
                     Spacer()
                 } // HS
                 Divider().padding(.vertical, 5)
 // MARK: - FLIGHTS
                 HStack(spacing: 30) {
                     VStack(spacing: 14) {
                         LabelView(label: "Flight Nº")
                         VStack(spacing: 14) {
                         TextField("1234", text: $flight1)
                                 .onSubmit { lastSubmit = flight1
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .flight1)
                                 .limitInputLength(value: $flight1, length: 4)
                         TextField("1234", text: $flight2)
                                 .onSubmit { lastSubmit = flight2
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .flight2)
                                 .limitInputLength(value: $flight2, length: 4)
                         TextField("1234", text: $flight3)
                                 .onSubmit { lastSubmit = flight3
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .flight3)
                                 .limitInputLength(value: $flight3, length: 4)
                         TextField("1234", text: $flight4)
                                 .onSubmit { lastSubmit = flight4
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .flight4)
                                 .limitInputLength(value: $flight4, length: 4)
                         }.modifier(FlightsDetails())
                     } // VS
                     VStack(spacing: 14) {
                         LabelView(label: "ETD")
                         VStack(spacing: 14) {
                         TextField("5678", text: $departure1)
                                 .onSubmit { lastSubmit = departure1
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .departure1)
                                 .limitInputLength(value: $departure1, length: 4)
                         TextField("5678", text: $departure2)
                                 .onSubmit { lastSubmit = departure2
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .departure2)
                                 .limitInputLength(value: $departure2, length: 4)
                         TextField("5678", text: $departure3)
                                 .onSubmit { lastSubmit = departure3
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .departure3)
                                 .limitInputLength(value: $departure3, length: 4)
                         TextField("5678", text: $departure4)
                                 .onSubmit { lastSubmit = departure4
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .departure4)
                                 .limitInputLength(value: $departure4, length: 4)
                         }.modifier(FlightsDetails())
                     } // VS
                     VStack(spacing: 14) {
                         LabelView(label: "ETA")
                         VStack(spacing: 14) {
                         TextField("9012", text: $arrival1)
                                 .onSubmit { lastSubmit = arrival1
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .arrival1)
                                 .limitInputLength(value: $arrival1, length: 4)
                         TextField("9012", text: $arrival2)
                                 .onSubmit { lastSubmit = arrival2
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .arrival2)
                                 .limitInputLength(value: $arrival2, length: 4)
                         TextField("9012", text: $arrival3)
                                 .onSubmit { lastSubmit = arrival3
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .arrival3)
                                 .limitInputLength(value: $arrival3, length: 4)
                         TextField("9012", text: $arrival4)
                                 .onSubmit { lastSubmit = arrival4
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .arrival4)
                                 .limitInputLength(value: $arrival4, length: 4)
                         }.modifier(FlightsDetails())
                     } // VS
                     VStack(spacing: 14) {
                         LabelView(label: "PAX")
                         VStack(spacing: 14) {
                         TextField("345", text: $pax1)
                                 .onSubmit { lastSubmit = pax1
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .pax1)
                                 .limitInputLength(value: $pax1, length: 3)
                         TextField("345", text: $pax2)
                                 .onSubmit { lastSubmit = pax2
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .pax2)
                                 .limitInputLength(value: $pax2, length: 3)
                         TextField("345", text: $pax3)
                                 .onSubmit { lastSubmit = pax3
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .pax3)
                                 .limitInputLength(value: $pax3, length: 3)
                         TextField("345", text: $pax4)
                                 .onSubmit { lastSubmit = pax4
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .pax4)
                                 .limitInputLength(value: $pax4, length: 3)
                         }.modifier(FlightsDetails())
                     } // VS
                 } // HS
                 Divider().padding(.vertical, 5)
 // MARK: - CREW
                 LabelView(label: "CREW")
                 VStack(spacing: 20) {
                     HStack {
                         LabelView(label: "C - ")
                         TextField("Flight crew 1", text: $flightcrew1).modifier(CrewDetails())
                             .onSubmit { lastSubmit = flightcrew1
                                 if let focus = focus { self.focus = focus.next() } }
                             .focused($focus, equals: .flightcrew1)
                     }
                     HStack {
                         LabelView(label: "F - ")
                         TextField("Flight crew 2", text: $flightcrew2).modifier(CrewDetails())
                             .onSubmit { lastSubmit = flightcrew2
                                 if let focus = focus { self.focus = focus.next() } }
                             .focused($focus, equals: .flightcrew2)
                     }
                     HStack {
                         LabelView(label: "2 - ")
                         TextField("Cabin crew 2", text: $cabincrew2).modifier(CrewDetails())
                             .onSubmit { lastSubmit = cabincrew2
                                 if let focus = focus { self.focus = focus.next() } }
                             .focused($focus, equals: .cabincrew2)
                     }
                     HStack {
                         LabelView(label: "3 - ")
                         TextField("Cabin crew 3", text: $cabincrew3).modifier(CrewDetails())
                             .onSubmit { lastSubmit = cabincrew3
                                 if let focus = focus { self.focus = focus.next() } }
                             .focused($focus, equals: .cabincrew3)
                     }
                     HStack {
                         LabelView(label: "4 - ")
                         TextField("Cabin crew 4", text: $cabincrew4).modifier(CrewDetailsDone())
                             .onSubmit { lastSubmit = cabincrew4
                                 if let focus = focus { self.focus = focus.next() } }
                             .focused($focus, equals: .cabincrew4)
                     }
                     HStack {
                         LabelView(label: "B - ")
                         TextField("Cabin crew 5", text: $cabincrew5).modifier(CrewDetailsDone())
                             .onSubmit { lastSubmit = cabincrew5
                                 if let focus = focus { self.focus = focus.next() } }
                             .focused($focus, equals: .cabincrew5)
                     }
                 } // VS
                 Spacer()
             } // SV
             .padding()
             .navigationTitle("Today's info")
             .navigationBarTitleDisplayMode(.inline)
             .onAppear { addTabColor() }
             .toolbar {
                 ToolbarItem(placement: .navigationBarTrailing) { saveDataButton() }
                 ToolbarItemGroup(placement: .keyboard) {
                     ChevronLeft()
                     Spacer()
                     DoneButton()
                     Spacer()
                     ChevronRight()
                 }
             }
         }.navigationViewStyle(.stack)
     } // BY
 // MARK: - FUNCTIONS
     func addTabColor() {
         let appearance = UINavigationBarAppearance()
         appearance.backgroundColor = UIColor(Color("tb"))
         UINavigationBar.appearance().standardAppearance = appearance
         UINavigationBar.appearance().scrollEdgeAppearance = appearance
     }
     func saveDataButton() -> some View {
         Button(action: {
             Flightdata.addFlightsData(
                 des1: destination1, des2: destination2, reg: registration,
                 fli1: flight1, dep1: departure1, arr1: arrival1, pa1: pax1,
                 fli2: flight2, dep2: departure2, arr2: arrival2, pa2: pax2,
                 fli3: flight3, dep3: departure3, arr3: arrival3, pa3: pax3,
                 fli4: flight4, dep4: departure4, arr4: arrival4, pa4: pax4,
                 flig1: flightcrew1, flig2: flightcrew2, cab2: cabincrew2, cab3: cabincrew3, cab4: cabincrew4, cab5: cabincrew5)
             dismiss()
         }) {
             Text("Save")
         }.disabled(destination1.isEmpty)
     }
     func ChevronLeft() -> some View {
         Button {
             if let focus = focus {
                 self.focus = focus.previous()
             }
         } label: {
             Image(systemName: "chevron.left")
         }.disabled(!hasPreviousTextField)
     }
     func DoneButton() -> some View {
         Button { focus = nil } label: { Text("Done") }
     }
     func ChevronRight() -> some View {
         Button {
             if let focus = focus { self.focus = focus.next() }
         } label: {
             Image(systemName: "chevron.right")
         }.disabled(!hasNextTextField)
     }
     var hasPreviousTextField: Bool {
         if let focus = focus, focus.previous() != nil {
             return true
         } else {
             return false
         }
     }
     var hasNextTextField: Bool {
         if let focus = focus, focus.next() != nil {
             return true
         } else {
             return false
         }
     }
 }
 
 // MARK: - PREVIEW
 struct ModelView_Previews: PreviewProvider {
     static var previews: some View {
         Group {
           //  ModelView()
             ModelView()
                 .preferredColorScheme(.dark)
         }
     }
 }
 ------
 
 
 */
