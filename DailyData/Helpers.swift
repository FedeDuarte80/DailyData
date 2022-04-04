
import SwiftUI

// Section 1
struct DayDetails: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(.roundedBorder)
            .frame(width: 65)
            .multilineTextAlignment(.center)
            .submitLabel(.next)
            .textInputAutocapitalization(.characters)
    }
}
// Section 2
struct FlightsDetails: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(.roundedBorder)
            .frame(width: 65)
            .multilineTextAlignment(.center)
            .submitLabel(.next)
            .keyboardType(UIKeyboardType.phonePad)
    }
}
// Section 3
struct CrewDetails: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(.roundedBorder)
            .multilineTextAlignment(.leading)
            .submitLabel(.next)
            .textInputAutocapitalization(.characters)
    }
}

// MARK: - TEXTFIELDLIMITMODIFIER

// .limitInputLength(value: $textfield, lenght: limit)

struct TextFieldLimitModifer: ViewModifier {
    @Binding var value: String
    var length: Int
    
    func body(content: Content) -> some View {
        content
            .onReceive(value.publisher.collect()) {
                value = String($0.prefix(length))
            }
    }
}

extension View {
    func limitInputLength(value: Binding<String>, length: Int) -> some View {
        self.modifier(TextFieldLimitModifer(value: value, length: length))
    }
}

/*
  JUNK DATA
 
 struct ContentView: View {
     @Environment(\.managedObjectContext) var moc
     @FetchRequest(entity: Flightdata.entity(), sortDescriptors: []) var flightdata: FetchedResults<Flightdata>
     @State private var destination1 = ""
     @State private var destination2 = ""
     @State private var registration = ""
     var body: some View {
         VStack {
             TextField("Destination 1", text: $destination1)
             TextField("Destination 2", text: $destination2)
             TextField("Registration", text: $registration)
 
             HStack {
                 Button {
                     addData()
                 } label: {
                     Text("Add data")
             }
                 Button {
                     deleteData()
                 } label: {
                     Text("Delete data")
                 }
             }
             List {
                 ForEach(flightdata) { flight in
                     HStack {
                         Text(flight.destination1Name)
                         Text(flight.destination2Name)
                         Text(flight.registrationName)
                     }
                 }
             } .border(.yellow)
             List {
                 ForEach(flightdata) { fl in
                     HStack {
                         TextField(fl.destination1Name, text: $destination1).modifier(DayDetails())
                         TextField(fl.destination2Name, text: $destination2).modifier(DayDetails())
                         TextField(fl.registrationName, text: $registration)
                     }
                 }
             }
         }
     }
     func addData() {
         let newData = Flightdata(context: moc)
         newData.destination1 = destination1
         newData.destination2 = destination2
         newData.registration = registration
         print("Trying to save data")
         PersistentContainer.saveContext()
     }
     func deleteData() {
         let deleteData = Flightdata(context: moc)
         deleteData.destination1 = ""
         deleteData.destination2 = ""
         deleteData.registration = ""
         print("Deleting all data")
         PersistentContainer.saveContext()
     }
 }
 
 struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
         ContentView()
     }
 }
-----------
 
 struct HomeView: View {
     @Environment(\.managedObjectContext) var moc
     @FetchRequest(entity: Flightdata.entity(), sortDescriptors: []) var flightdata: FetchedResults<Flightdata>
 
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
     /*
      List {
          ForEach(flightdata) { fl in
              HStack {
                  TextField(fl.destination1Name, text: $destination1)
                  TextField(fl.destination2Name, text: $destination2)
                  TextField(fl.registrationName, text: $registration)
              }
          }
      }
      */
 // MARK: - BODY
     var body: some View {
         NavigationView {
             ScrollView {
                 HStack {
 // MARK: - DESTINATION
                     VStack(alignment: .leading) {
                         Text("Destination: ")
                             HStack {
                                 TextField("ZRH", text: $destination1).modifier(DayDetails())
                                 Text("-")
                                 TextField("AGP", text: $destination2).modifier(DayDetails())
 
                         } // HS
                     } // VS
                     Spacer()
 // MARK: - REGISTRATION
                     VStack(alignment: .leading) {
                         Text("AC Registration: ")
                         HStack {
                            Text("EC -")
                            TextField("JSY", text: $registration).modifier(DayDetails())
                         } // HS
                     } // VS
                     Spacer()
                 } // HS
                 Divider().padding(.vertical, 5)
 // MARK: - FLIGHTS
                 HStack(spacing: 30) {
                     VStack(spacing: 14) {
                         Text("Flight Nº")
                         VStack(spacing: 14) {
                         TextField("1234", text: $flight1)
                         TextField("1234", text: $flight2)
                         TextField("1234", text: $flight3)
                         TextField("1234", text: $flight4)
                         }.modifier(FlightsDetails())
                     } // VS
                     VStack(spacing: 14) {
                         Text("ETDº")
                         VStack(spacing: 14) {
                         TextField("5678", text: $departure1)
                         TextField("5678", text: $departure2)
                         TextField("5678", text: $departure3)
                         TextField("5678", text: $departure4)
                         }.modifier(FlightsDetails())
                     } // VS
                     VStack(spacing: 14) {
                         Text("ETA")
                         VStack(spacing: 14) {
                         TextField("9012", text: $arrival1)
                         TextField("9012", text: $arrival2)
                         TextField("9012", text: $arrival3)
                         TextField("9012", text: $arrival4)
                         }.modifier(FlightsDetails())
                     } // VS
                     VStack(spacing: 14) {
                         Text("PAX")
                         VStack(spacing: 14) {
                         TextField("345", text: $pax1)
                         TextField("345", text: $pax2)
                         TextField("345", text: $pax3)
                         TextField("345", text: $pax4)
                         }.modifier(FlightsDetails())
                     } // VS
                 } // HS
                 Divider().padding(.vertical, 5)
 // MARK: - CREW
                 Text("CREW")
                 VStack(spacing: 20) {
                     HStack {
                         Text("C - ")
                         TextField("Flight crew 1", text: $flightcrew1).modifier(CrewDetails())
                     }
                     HStack {
                         Text("F - ")
                         TextField("Flight crew 2", text: $flightcrew2).modifier(CrewDetails())
                     }
                     HStack {
                         Text("2 - ")
                         TextField("Cabin crew 2", text: $cabincrew2).modifier(CrewDetails())
                     }
                     HStack {
                         Text("3 - ")
                         TextField("Cabin crew 3", text: $cabincrew3).modifier(CrewDetails())
                     }
                     HStack {
                         Text("4 - ")
                         TextField("Cabin crew 4", text: $cabincrew4).modifier(CrewDetails())
                     }
                     HStack {
                         Text("B - ")
                         TextField("Cabin crew 5", text: $cabincrew5).modifier(CrewDetails())
                     }
                 } // VS
             } // SV
             .padding()
             .navigationTitle("DailyCrew")
             .navigationBarTitleDisplayMode(.inline)
             .onAppear {
                 let appearance = UINavigationBarAppearance()
                 appearance.backgroundColor = UIColor(Color("tb"))
                 UINavigationBar.appearance().standardAppearance = appearance
                 UINavigationBar.appearance().scrollEdgeAppearance = appearance
             }
         }// NV
     }
 }
 
 // MARK: - PREVIEW
 struct HomeView_Previews: PreviewProvider {
     static var previews: some View {
         HomeView()
     }
 }

 ----------------------------
 
 
  struct HomeView: View {
      @Environment(\.managedObjectContext) private var moc
      @FetchRequest(fetchRequest: Entity.allEntity()) var allDeta: FetchedResults<Entity>
      
      
      @State private var destination1 = ""
      @State private var destination2 = ""
      @State private var registration = ""
      
      @State private var flight1 = ""
      @State private var etd1 = ""
      @State private var eta1 = ""
      @State private var pax1 = ""
      
      @State private var flight2 = ""
      @State private var etd2 = ""
      @State private var eta2 = ""
      @State private var pax2 = ""
      
      @State private var flight3 = ""
      @State private var etd3 = ""
      @State private var eta3 = ""
      @State private var pax3 = ""
      
      @State private var flight4 = ""
      @State private var etd4 = ""
      @State private var eta4 = ""
      @State private var pax4 = ""
      
      @State private var captain = ""
      @State private var firsto = ""
      @State private var number2 = ""
      @State private var number3 = ""
      @State private var number4 = ""
      @State private var numberB = ""
      
      @State var lastSubmit: String = "None"
      @FocusState var focus: OrderField?
      
      enum OrderField: Int, Hashable, CaseIterable {
          case destination1
          case destination2
          case registration
          case flight1
          case etd1
          case eta1
          case pax1
          case flight2
          case etd2
          case eta2
          case pax2
          case flight3
          case etd3
          case eta3
          case pax3
          case flight4
          case etd4
          case eta4
          case pax4
          case captain
          case firsto
          case number2
          case number3
          case number4
          case numberB
          
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
      
      var body: some View {
          NavigationView {
              ScrollView {
   
                          HStack {
                              // MARK: - DES/REG
                              
                              VStack(alignment: .leading) {
                                  Text("Destinations:")
                                  HStack {
                                      TextField("ZRH", text: $destination1).modifier(DestinationRegistration())
                                          .onSubmit {
                                              lastSubmit = destination1
                                              if let focus = focus {
                                                  self.focus = focus.next()
                                              }
                                          }
                                          .focused($focus, equals: .destination1)
                                      Text("-")
                                      TextField("AGP", text: $destination2).modifier(DestinationRegistration())
                                          .onSubmit {
                                              lastSubmit = destination2
                                              if let focus = focus {
                                                  self.focus = focus.next()
                                              }
                                          }
                                          .focused($focus, equals: .destination2)
                                  }
                              }.padding(.leading)
                              Spacer()
                              VStack(alignment: .leading) {
                                  Text("AC Registration:")
                                  HStack {
                                      Text("EC -")
                                      TextField("JSY", text: $registration).modifier(DestinationRegistration())
                                          .onSubmit {
                                              lastSubmit = registration
                                              if let focus = focus {
                                                  self.focus = focus.next()
                                              }
                                          }
                                          .focused($focus, equals: .registration)
                                  }
                              }
                              Spacer()
                          }
                          
                          Divider().padding(.vertical, 5)
                          
                          // MARK: - FLIGHTS
                          HStack(spacing: 30) {
                              VStack(spacing: 14) { // Flight
                                  Text("Flight Nº")
                                  TextField("1234", text: $flight1).modifier(FlightsDetails())
                                      .onSubmit { lastSubmit = flight1
                                          if let focus = focus { self.focus = focus.next() } }
                                      .focused($focus, equals: .flight1)
                                  TextField("1234", text: $flight2).modifier(FlightsDetails())
                                      .onSubmit { lastSubmit = flight2
                                          if let focus = focus { self.focus = focus.next() } }
                                      .focused($focus, equals: .flight2)
                                  TextField("1234", text: $flight3).modifier(FlightsDetails())
                                      .onSubmit { lastSubmit = flight3
                                          if let focus = focus { self.focus = focus.next() } }
                                      .focused($focus, equals: .flight3)
                                  TextField("1234", text: $flight4).modifier(FlightsDetails())
                                      .onSubmit { lastSubmit = flight4
                                          if let focus = focus { self.focus = focus.next() } }
                                      .focused($focus, equals: .flight4)
                              }
                              VStack(spacing: 14) { // etd
                                  Text("ETD")
                                  TextField("5678", text: $etd1).modifier(FlightsDetails())
                                      .onSubmit { lastSubmit = etd1
                                          if let focus = focus { self.focus = focus.next() } }
                                      .focused($focus, equals: .etd1)
                                  TextField("5678", text: $etd2).modifier(FlightsDetails())
                                      .onSubmit { lastSubmit = etd2
                                          if let focus = focus { self.focus = focus.next() } }
                                      .focused($focus, equals: .etd2)
                                  TextField("5678", text: $etd3).modifier(FlightsDetails())
                                      .onSubmit { lastSubmit = etd3
                                          if let focus = focus { self.focus = focus.next() } }
                                      .focused($focus, equals: .etd3)
                                  TextField("5678", text: $etd4).modifier(FlightsDetails())
                                      .onSubmit { lastSubmit = etd4
                                          if let focus = focus { self.focus = focus.next() } }
                                      .focused($focus, equals: .etd4)
                              }
                              VStack(spacing: 14) { // eta
                                  Text("ETA")
                                  TextField("9012", text: $eta1).modifier(FlightsDetails())
                                      .onSubmit { lastSubmit = eta1
                                          if let focus = focus { self.focus = focus.next() } }
                                      .focused($focus, equals: .eta1)
                                  TextField("9012", text: $eta2).modifier(FlightsDetails())
                                      .onSubmit { lastSubmit = eta2
                                          if let focus = focus { self.focus = focus.next() } }
                                      .focused($focus, equals: .eta2)
                                  TextField("9012", text: $eta3).modifier(FlightsDetails())
                                      .onSubmit { lastSubmit = eta3
                                          if let focus = focus { self.focus = focus.next() } }
                                      .focused($focus, equals: .eta3)
                                  TextField("9012", text: $eta4).modifier(FlightsDetails())
                                      .onSubmit { lastSubmit = eta4
                                          if let focus = focus { self.focus = focus.next() } }
                                      .focused($focus, equals: .eta4)
                              }
                              VStack(spacing: 14) { // pax
                                  Text("Pax")
                                  TextField("345", text: $pax1).modifier(FlightsDetails())
                                      .onSubmit { lastSubmit = pax1
                                          if let focus = focus { self.focus = focus.next() } }
                                      .focused($focus, equals: .pax1)
                                  TextField("345", text: $pax2).modifier(FlightsDetails())
                                      .onSubmit { lastSubmit = pax2
                                          if let focus = focus { self.focus = focus.next() } }
                                      .focused($focus, equals: .pax2)
                                  TextField("345", text: $pax3).modifier(FlightsDetails())
                                      .onSubmit { lastSubmit = pax3
                                          if let focus = focus { self.focus = focus.next() } }
                                      .focused($focus, equals: .pax3)
                                  TextField("345", text: $pax4).modifier(FlightsDetails())
                                      .onSubmit { lastSubmit = pax4
                                          if let focus = focus { self.focus = focus.next() } }
                                      .focused($focus, equals: .pax4)
                              }
                          }
                          Divider().padding(.vertical, 5)
                          // MARK: - CREW
                          Text("Crew")
                          
                          VStack(spacing: 20) {
                              HStack {
                                  Text("C - ")
                                  TextField("Captain", text: $captain).modifier(CrewDetails())
                                      .onSubmit { lastSubmit = captain
                                          if let focus = focus { self.focus = focus.next() } }
                                      .focused($focus, equals: .captain)
                              }
                              HStack {
                                  Text("F - ")
                                  TextField("Firstofficer", text: $firsto).modifier(CrewDetails())
                                      .onSubmit { lastSubmit = firsto
                                          if let focus = focus { self.focus = focus.next() } }
                                      .focused($focus, equals: .firsto)
                              }
                              HStack {
                                  Text("2 - ")
                                  TextField("number 2", text: $number2).modifier(CrewDetails())
                                      .onSubmit { lastSubmit = number2
                                          if let focus = focus { self.focus = focus.next() } }
                                      .focused($focus, equals: .number2)
                              }
                              HStack {
                                  Text("3 - ")
                                  TextField("number 3", text: $number3).modifier(CrewDetails())
                                      .onSubmit { lastSubmit = number3
                                          if let focus = focus { self.focus = focus.next() } }
                                      .focused($focus, equals: .number3)
                              }
                              HStack {
                                  Text("4 - ")
                                  TextField("number 4", text: $number4)
                                      .textFieldStyle(.roundedBorder)
                                      .multilineTextAlignment(.leading)
                                      .submitLabel(.done)
                                      .textInputAutocapitalization(.characters)
                                      .onSubmit { lastSubmit = number4
                                          if let focus = focus { self.focus = focus.next() } }
                                      .focused($focus, equals: .number4)
                              }
                              
                              HStack {
                                  Text("B - ")
                                  TextField("number 4B", text: $numberB)
                                      .textFieldStyle(.roundedBorder)
                                      .multilineTextAlignment(.leading)
                                      .submitLabel(.done)
                                      .textInputAutocapitalization(.characters)
                                      .onSubmit { lastSubmit = numberB
                                          if let focus = focus { self.focus = focus.next() } }
                                      .focused($focus, equals: .numberB)
                              }
                          } // VS
              } // SW
              
              // MARK: - MODIFIERS
              .padding()
              .background(Color("bg"))
              .tint(.accentColor)
              .navigationTitle("DailyCrew")
              .navigationBarTitleDisplayMode(.inline)
              .toolbar {
                  ToolbarItem(placement: .navigationBarLeading) {
                      Button {
                          print("Clear all function triggered")
                      } label: {
                          Text("Clear All")
                      }
                  }
                  ToolbarItem(placement: .navigationBarTrailing) {
                      Button {
                         
                          print("func newEntity CALLED")
                      } label: {
                          Text("Save")
                      }
                  }
                  ToolbarItemGroup(placement: .keyboard) {
                      Button {
                          if let focus = focus {
                              self.focus = focus.previous()
                          }
                      } label: {
                          Image(systemName: "chevron.up")
                      }.disabled(!hasPreviousTextField)
                      Spacer()
                      Button { // Test this
                          focus = nil
                      } label: {
                          Text("Done")
                      }
                      Spacer()
                      Button {
                          if let focus = focus {
                              self.focus = focus.next()
                          }
                      } label: {
                          Image(systemName: "chevron.down")
                      }.disabled(!hasNextTextField)
                  }
              }
              .onAppear {
                  let appearance = UINavigationBarAppearance()
                  appearance.backgroundColor = UIColor(Color("tabbarColor"))
                  UINavigationBar.appearance().standardAppearance = appearance
                  UINavigationBar.appearance().scrollEdgeAppearance = appearance
              }
          } //NV
          .navigationViewStyle(.stack)
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
 */
