//  Created by Fede Duarte on 23/5/22.

import SwiftUI
import CoreData

struct SingleView: View {

// MARK: - PROPERTIES
    @FetchRequest(fetchRequest: Flightdata.getFlightdata()) var flightdata: FetchedResults<Flightdata>
    @State var lastSubmit: String = "None"
    @State private var showingAlert = false
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
        case flightNumber1
        case flightcrew2
        case flightNumber2
        case cabincrew2
        case crewNumber2
        case cabincrew3
        case crewNumber3
        case cabincrew4
        case crewNumber4
        case cabincrew5
        case crewNumber5
        
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
    
// MARK: - VARIABLES
    
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
    @State private var flightNumber1 = ""
    @State private var flightNumber2 = ""
    @State private var crewNumber2 = ""
    @State private var crewNumber3 = ""
    @State private var crewNumber4 = ""
    @State private var crewNumber5 = ""
    
// MARK: - BODY
    var body: some View {
        NavigationView {
                ScrollView {
                   // Text("DailyData").padding(.bottom, 5)

                    
                   ForEach(flightdata) { f in
                       
// MARK: - Destination
                       
                    HStack {
                        VStack(alignment: .leading) {
                            LabelView(label: "Destination:")
                            HStack {
                                TextField(f.destination1Name, text: $destination1).modifier(DayDetails())
                                    .onSubmit { lastSubmit = destination1
                                        if let focus = focus { self.focus = focus.next() } }
                                    .focused($focus, equals: .destination1)
                                    .limitInputLength(value: $destination1, length: 3)
                                LabelView(label: "-")
                                
                                TextField(f.destination2Name, text: $destination2).modifier(DayDetails())
                                    .onSubmit { lastSubmit = destination2
                                        if let focus = focus { self.focus = focus.next() } }
                                    .focused($focus, equals: .destination2)
                                    .limitInputLength(value: $destination2, length: 3)
                            }
                            
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            LabelView(label: "Registration:")
                            HStack {
                                Text("EC - ").modifier(Labels())
                                TextField(f.registrationName, text: $registration).modifier(regDetails())
                                    .onSubmit { lastSubmit = registration
                                        if let focus = focus { self.focus = focus.next() } }
                                    .focused($focus, equals: .registration)
                                    .limitInputLength(value: $registration, length: 9)
                            }
                        }
                        Spacer()
                        
                    } // HS
                    
                    
                    
                    .padding(.horizontal, 5)
                    Divider().padding(.vertical)
                    
// MARK: - FLIGHTS
                       
                    HStack(spacing: 40) {
                        
                        VStack(spacing: 14) {
                            LabelView(label: "Flight Nº")
                            VStack(spacing: 14) {
                                TextField(f.flight1Name, text: $flight1)
                                    .onSubmit { lastSubmit = flight1
                                        if let focus = focus { self.focus = focus.next() } }
                                    .focused($focus, equals: .flight1)
                                    .limitInputLength(value: $flight1, length: 4)
                                
                                TextField(f.flight2Name, text: $flight2)
                                    .onSubmit { lastSubmit = flight2
                                        if let focus = focus { self.focus = focus.next() } }
                                    .focused($focus, equals: .flight2)
                                    .limitInputLength(value: $flight2, length: 4)
                                
                                TextField(f.flight3Name, text: $flight3)
                                    .onSubmit { lastSubmit = flight3
                                        if let focus = focus { self.focus = focus.next() } }
                                    .focused($focus, equals: .flight3)
                                    .limitInputLength(value: $flight3, length: 4)
                                
                                TextField(f.flight4Name, text: $flight4)
                                    .onSubmit { lastSubmit = flight4
                                        if let focus = focus { self.focus = focus.next() } }
                                    .focused($focus, equals: .flight4)
                                    .limitInputLength(value: $flight4, length: 4)
                                
                            }.modifier(FlightsDetails())
                        } // VS
                        // MARK: - DEPARTURES
                        VStack(spacing: 14) {
                            LabelView(label: "ETD")
                            VStack(spacing: 14) {
                                TextField(f.departure1Name, text: $departure1)
                                    .onSubmit { lastSubmit = departure1
                                        if let focus = focus { self.focus = focus.next() } }
                                    .focused($focus, equals: .departure1)
                                    .limitInputLength(value: $departure1, length: 4)
                                
                                TextField(f.departure2Name, text: $departure2)
                                    .onSubmit { lastSubmit = departure2
                                        if let focus = focus { self.focus = focus.next() } }
                                    .focused($focus, equals: .departure2)
                                    .limitInputLength(value: $departure2, length: 4)
                                
                                TextField(f.departure3Name, text: $departure3)
                                    .onSubmit { lastSubmit = departure3
                                        if let focus = focus { self.focus = focus.next() } }
                                    .focused($focus, equals: .departure3)
                                    .limitInputLength(value: $departure3, length: 4)
                                
                                TextField(f.departure4Name, text: $departure4)
                                    .onSubmit { lastSubmit = departure4
                                        if let focus = focus { self.focus = focus.next() } }
                                    .focused($focus, equals: .departure4)
                                    .limitInputLength(value: $departure4, length: 4)
                                
                            }.modifier(FlightsDetails())
                        } // VS
                        // MARK: - ARRIVALS
                        VStack(spacing: 14) {
                            LabelView(label: "ETA")
                            VStack(spacing: 14) {
                                TextField(f.arrival1Name, text: $arrival1)
                                    .onSubmit { lastSubmit = arrival1
                                        if let focus = focus { self.focus = focus.next() } }
                                    .focused($focus, equals: .arrival1)
                                    .limitInputLength(value: $arrival1, length: 4)
                                
                                TextField(f.arrival2Name, text: $arrival2)
                                    .onSubmit { lastSubmit = arrival2
                                        if let focus = focus { self.focus = focus.next() } }
                                    .focused($focus, equals: .arrival2)
                                    .limitInputLength(value: $arrival2, length: 4)
                                
                                TextField(f.arrival3Name, text: $arrival3)
                                    .onSubmit { lastSubmit = arrival3
                                        if let focus = focus { self.focus = focus.next() } }
                                    .focused($focus, equals: .arrival3)
                                    .limitInputLength(value: $arrival3, length: 4)
                                
                                TextField(f.arrival4Name, text: $arrival4)
                                    .onSubmit { lastSubmit = arrival4
                                        if let focus = focus { self.focus = focus.next() } }
                                    .focused($focus, equals: .arrival4)
                                    .limitInputLength(value: $arrival4, length: 4)
                                
                            }.modifier(FlightsDetails())
                        } // VS
                        // MARK: - PAXS
                        VStack(spacing: 14) {
                            LabelView(label: "PAX")
                            VStack(spacing: 14) {
                                TextField(f.pax1Name, text: $pax1)
                                    .onSubmit { lastSubmit = pax1
                                        if let focus = focus { self.focus = focus.next() } }
                                    .focused($focus, equals: .pax1)
                                    .limitInputLength(value: $pax1, length: 3)
                                
                                TextField(f.pax2Name, text: $pax2)
                                    .onSubmit { lastSubmit = pax2
                                        if let focus = focus { self.focus = focus.next() } }
                                    .focused($focus, equals: .pax2)
                                    .limitInputLength(value: $pax2, length: 3)
                                
                                TextField(f.pax3Name, text: $pax3)
                                    .onSubmit { lastSubmit = pax3
                                        if let focus = focus { self.focus = focus.next() } }
                                    .focused($focus, equals: .pax3)
                                    .limitInputLength(value: $pax3, length: 3)
                                
                                TextField(f.pax4Name, text: $pax4)
                                    .onSubmit { lastSubmit = pax4
                                        if let focus = focus { self.focus = focus.next() } }
                                    .focused($focus, equals: .pax4)
                                    .limitInputLength(value: $pax4, length: 3)
                                
                            }.modifier(FlightsDetails())
                        } // VS
                    } // HS
                    
                    .padding(.horizontal, 5)
                    Divider().padding(.vertical)
                    
// MARK: - CREW
                    
                    VStack(alignment: .leading ,spacing: 20) {
                        HStack {
                            LabelView(label: "C -")
                            TextField(f.flightcrew1Name, text: $flightcrew1).modifier(CrewDetails())
                                .onSubmit { lastSubmit = flightcrew1
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .flightcrew1)
                                .limitInputLength(value: $flightcrew1, length: 12)
                            
                            TextField(f.flightcrew1Number, text: $flightNumber1).modifier(CrewNumbers())
                                .onSubmit { lastSubmit = flightNumber1
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .flightNumber1)
                                .limitInputLength(value: $flightNumber1, length: 5)
                        }
                        HStack {
                            LabelView(label: "F -")
                            TextField(f.flightcrew2Name, text: $flightcrew2).modifier(CrewDetails())
                                .onSubmit { lastSubmit = flightcrew2
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .flightcrew2)
                                .limitInputLength(value: $flightcrew2, length: 12)
                            
                            TextField(f.flightcrew2Number, text: $flightNumber2).modifier(CrewNumbers())
                                .onSubmit { lastSubmit = flightNumber2
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .flightNumber2)
                                .limitInputLength(value: $flightNumber2, length: 5)
                        }
                        HStack {
                            LabelView(label: "2 -")
                            TextField(f.cabincrew2Name, text: $cabincrew2).modifier(CrewDetails())
                                .onSubmit { lastSubmit = cabincrew2
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .cabincrew2)
                                .limitInputLength(value: $cabincrew2, length: 12)
                            
                            TextField(f.crew2Number, text: $crewNumber2).modifier(CrewNumbers())
                                .onSubmit { lastSubmit = crewNumber2
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .crewNumber2)
                                .limitInputLength(value: $crewNumber2, length: 5)
                        }
                        HStack {
                            LabelView(label: "3 -")
                            TextField(f.cabincrew3Name, text: $cabincrew3).modifier(CrewDetails())
                                .onSubmit { lastSubmit = cabincrew3
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .cabincrew3)
                                .limitInputLength(value: $cabincrew3, length: 12)
                            
                            TextField(f.crew3Number, text: $crewNumber3).modifier(CrewNumbers())
                                .onSubmit { lastSubmit = crewNumber3
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .crewNumber3)
                                .limitInputLength(value: $crewNumber3, length: 5)
                        }
                        HStack {
                            LabelView(label: "4 -")
                            TextField(f.cabincrew4Name, text: $cabincrew4).modifier(CrewDetails())
                                .onSubmit { lastSubmit = cabincrew4
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .cabincrew4)
                                .limitInputLength(value: $cabincrew4, length: 12)
                            
                            TextField(f.crew4Number, text: $crewNumber4).modifier(CrewNumbers())
                                .onSubmit { lastSubmit = crewNumber4
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .crewNumber4)
                                .limitInputLength(value: $crewNumber4, length: 5)
                        }
                        HStack {
                            LabelView(label: "B -")
                            TextField(f.cabincrew5Name, text: $cabincrew5).modifier(CrewDetails())
                                .onSubmit { lastSubmit = cabincrew5
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .cabincrew5)
                                .limitInputLength(value: $cabincrew5, length: 12)
                            
                            TextField(f.crew5Number, text: $crewNumber5).modifier(CrewNumbers())
                                .onSubmit { lastSubmit = crewNumber5
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .crewNumber5)
                                .limitInputLength(value: $crewNumber5, length: 5)
                        }
                    } // VS
                    
                    .padding(.horizontal, 5)
                       
                   } // FE
                    
                    // MARK: - FOOTER
                        
//                    HStack {
//                        clearButton()
//                            .padding(.leading)
//
//                        Spacer()
//
//                        Image(systemName: "lock.fill")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 34, height: 34)
//                            .padding(.top)
//
//                        Spacer()
//
//                        Text("Update")
//                            .padding(.trailing)
//                    }
//
//                    .foregroundColor(.accentColor)
//                    .background(Color("tb"))
                    
                } // VS

// MARK: - TOOLBAR
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading, content: clearButton)
                    ToolbarItemGroup(placement: .keyboard) {
                        ChevronLeft().padding()
                        Spacer()
                        DoneButton()
                        Spacer()
                        ChevronRight().padding()
                    }
                }
                .confirmationDialog("Are you sure you want to delete all the data?", isPresented: $showingAlert, titleVisibility: .visible) {
                    Button("DELETE ALL", role: .destructive) { PersistentContainer.deleteBatch() } }
                //.navigationBarHidden(true)
                .navigationTitle("DailyData")
                .navigationBarTitleDisplayMode(.inline)
        } // NV
    }
    
// MARK: - FUNCTIONS
    func clearButton() -> some View {
        Button(action: { showingAlert.toggle() }) {Text("Clear") }
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
        Button { focus = nil } label: { Image(systemName: "keyboard.chevron.compact.down") }
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
    func saveData() -> some View {
        Button(action: {
            
        }) {
            Text("Update")
        }
    }
}

// MARK: - PREVIEW

struct SingleView_Previews: PreviewProvider {
    static var viewContext = PersistentContainer.persistentContainer.viewContext
    static var previews: some View {
//        let f = Flightdata(context: viewContext)
//        f.destination1 = "CUN"
        
        return SingleView()
            .preferredColorScheme(.dark)
            .environment(\.managedObjectContext, PersistentContainer.persistentContainer.viewContext)
    }
}


// WORKING VIEW


/*
 //  Created by Fede Duarte on 23/5/22.

 import SwiftUI
 import CoreData

 struct SingleView: View {

 // MARK: - PROPERTIES
     @FetchRequest(fetchRequest: Flightdata.getFlightdata()) var flightdata: FetchedResults<Flightdata>
  //   @ObservedObject var data: Flightdata
     @State var lastSubmit: String = "None"
     @State private var showingAlert = false
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
         case flightNumber1
         case flightcrew2
         case flightNumber2
         case cabincrew2
         case crewNumber2
         case cabincrew3
         case crewNumber3
         case cabincrew4
         case crewNumber4
         case cabincrew5
         case crewNumber5
         
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
     
 // MARK: - VARIABLES
     
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
     @State private var flightNumber1 = ""
     @State private var flightNumber2 = ""
     @State private var crewNumber2 = ""
     @State private var crewNumber3 = ""
     @State private var crewNumber4 = ""
     @State private var crewNumber5 = ""
     
 // MARK: - BODY
     var body: some View {
         ZStack {
             
             ScrollView(showsIndicators: false) {
                 
                 Text("DailyData").padding(.bottom)
 // MARK: - Destination
                 
                     HStack {
                         VStack(alignment: .leading) {
                             LabelView(label: "Destination:")
                             HStack {
                                 TextField("DUB", text: $destination1).modifier(DayDetails())
                                     .onSubmit { lastSubmit = destination1
                                         if let focus = focus { self.focus = focus.next() } }
                                     .focused($focus, equals: .destination1)
                                     .limitInputLength(value: $destination1, length: 3)
                                 LabelView(label: "-")
                                 
                                 TextField("IBZ", text: $destination2).modifier(DayDetails())
                                     .onSubmit { lastSubmit = destination2
                                         if let focus = focus { self.focus = focus.next() } }
                                     .focused($focus, equals: .destination2)
                                     .limitInputLength(value: $destination2, length: 3)
                             }
                         
                         }
                         Spacer()
                         VStack(alignment: .leading) {
                             LabelView(label: "Registration:")
                             HStack {
                                 Text("EC - ").modifier(Labels())
                                 TextField("MPY - LQP", text: $registration).modifier(regDetails())
                                     .onSubmit { lastSubmit = registration
                                         if let focus = focus { self.focus = focus.next() } }
                                     .focused($focus, equals: .registration)
                                     .limitInputLength(value: $registration, length: 9)
                             }
                         }
                         Spacer()
                     
                 } // HS
                 Divider().padding(.vertical)
                 
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
                             
                             TextField("5678", text: $flight2)
                                 .onSubmit { lastSubmit = flight2
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .flight2)
                                 .limitInputLength(value: $flight2, length: 4)
                             
                             TextField("9012", text: $flight3)
                                 .onSubmit { lastSubmit = flight3
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .flight3)
                                 .limitInputLength(value: $flight3, length: 4)
                             
                             TextField("3456", text: $flight4)
                                 .onSubmit { lastSubmit = flight4
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .flight4)
                                 .limitInputLength(value: $flight4, length: 4)
                             
                         }.modifier(FlightsDetails())
                     } // VS
 // MARK: - DEPARTURES
                     VStack(spacing: 14) {
                         LabelView(label: "ETD")
                         VStack(spacing: 14) {
                             TextField("1234", text: $departure1)
                                 .onSubmit { lastSubmit = departure1
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .departure1)
                                 .limitInputLength(value: $departure1, length: 4)
                             
                             TextField("5678", text: $departure2)
                                 .onSubmit { lastSubmit = departure2
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .departure2)
                                 .limitInputLength(value: $departure2, length: 4)
                             
                             TextField("9012", text: $departure3)
                                 .onSubmit { lastSubmit = departure3
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .departure3)
                                 .limitInputLength(value: $departure3, length: 4)
                             
                             TextField("3456", text: $departure4)
                                 .onSubmit { lastSubmit = departure4
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .departure4)
                                 .limitInputLength(value: $departure4, length: 4)
                             
                         }.modifier(FlightsDetails())
                     } // VS
 // MARK: - ARRIVALS
                     VStack(spacing: 14) {
                         LabelView(label: "ETA")
                         VStack(spacing: 14) {
                             TextField("1234", text: $arrival1)
                                 .onSubmit { lastSubmit = arrival1
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .arrival1)
                                 .limitInputLength(value: $arrival1, length: 4)
                             
                             TextField("5678", text: $arrival2)
                                 .onSubmit { lastSubmit = arrival2
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .arrival2)
                                 .limitInputLength(value: $arrival2, length: 4)
                             
                             TextField("9012", text: $arrival3)
                                 .onSubmit { lastSubmit = arrival3
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .arrival3)
                                 .limitInputLength(value: $arrival3, length: 4)
                             
                             TextField("3456", text: $arrival4)
                                 .onSubmit { lastSubmit = arrival4
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .arrival4)
                                 .limitInputLength(value: $arrival4, length: 4)
                             
                         }.modifier(FlightsDetails())
                     } // VS
 // MARK: - PAXS
                     VStack(spacing: 14) {
                         LabelView(label: "PAX")
                         VStack(spacing: 14) {
                             TextField("1234", text: $pax1)
                                 .onSubmit { lastSubmit = pax1
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .pax1)
                                 .limitInputLength(value: $pax1, length: 3)
                             
                             TextField("5678", text: $pax2)
                                 .onSubmit { lastSubmit = pax2
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .pax2)
                                 .limitInputLength(value: $pax2, length: 3)
                             
                             TextField("9012", text: $pax3)
                                 .onSubmit { lastSubmit = pax3
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .pax3)
                                 .limitInputLength(value: $pax3, length: 3)
                             
                             TextField("3456", text: $pax4)
                                 .onSubmit { lastSubmit = pax4
                                     if let focus = focus { self.focus = focus.next() } }
                                 .focused($focus, equals: .pax4)
                                 .limitInputLength(value: $pax4, length: 3)
                             
                         }.modifier(FlightsDetails())
                     } // VS
                 } // HS
                 
                 Divider()
                     .padding(.vertical)
                 
 // MARK: - CREW
                 
                 VStack(alignment: .leading ,spacing: 20) {
                     HStack {
                         LabelView(label: "C -")
                         TextField("Captain", text: $flightcrew1).modifier(CrewDetails())
                             .onSubmit { lastSubmit = flightcrew1
                                 if let focus = focus { self.focus = focus.next() } }
                             .focused($focus, equals: .flightcrew1)
                             .limitInputLength(value: $flightcrew1, length: 12)
                         
                         TextField("12345", text: $flightNumber1).modifier(CrewNumbers())
                             .onSubmit { lastSubmit = flightNumber1
                                 if let focus = focus { self.focus = focus.next() } }
                             .focused($focus, equals: .flightNumber1)
                             .limitInputLength(value: $flightNumber1, length: 5)
                     }
                     HStack {
                         LabelView(label: "F -")
                         TextField("First Officer", text: $flightcrew2).modifier(CrewDetails())
                             .onSubmit { lastSubmit = flightcrew2
                                 if let focus = focus { self.focus = focus.next() } }
                             .focused($focus, equals: .flightcrew2)
                             .limitInputLength(value: $flightcrew2, length: 12)
                         
                         TextField("12345", text: $flightNumber2).modifier(CrewNumbers())
                             .onSubmit { lastSubmit = flightNumber2
                                 if let focus = focus { self.focus = focus.next() } }
                             .focused($focus, equals: .flightNumber2)
                             .limitInputLength(value: $flightNumber2, length: 5)
                     }
                     HStack {
                         LabelView(label: "2 -")
                         TextField("Number 2", text: $cabincrew2).modifier(CrewDetails())
                             .onSubmit { lastSubmit = cabincrew2
                                 if let focus = focus { self.focus = focus.next() } }
                             .focused($focus, equals: .cabincrew2)
                             .limitInputLength(value: $cabincrew2, length: 12)
                         
                         TextField("12345", text: $crewNumber2).modifier(CrewNumbers())
                             .onSubmit { lastSubmit = crewNumber2
                                 if let focus = focus { self.focus = focus.next() } }
                             .focused($focus, equals: .crewNumber2)
                             .limitInputLength(value: $crewNumber2, length: 5)
                     }
                     HStack {
                         LabelView(label: "3 -")
                         TextField("Number 3", text: $cabincrew3).modifier(CrewDetails())
                             .onSubmit { lastSubmit = cabincrew3
                                 if let focus = focus { self.focus = focus.next() } }
                             .focused($focus, equals: .cabincrew3)
                             .limitInputLength(value: $cabincrew3, length: 12)
                         
                         TextField("12345", text: $crewNumber3).modifier(CrewNumbers())
                             .onSubmit { lastSubmit = crewNumber3
                                 if let focus = focus { self.focus = focus.next() } }
                             .focused($focus, equals: .crewNumber3)
                             .limitInputLength(value: $crewNumber3, length: 5)
                     }
                     HStack {
                         LabelView(label: "4 -")
                         TextField("Number 4", text: $cabincrew4).modifier(CrewDetails())
                             .onSubmit { lastSubmit = cabincrew4
                                 if let focus = focus { self.focus = focus.next() } }
                             .focused($focus, equals: .cabincrew4)
                             .limitInputLength(value: $cabincrew4, length: 12)
                         
                         TextField("12345", text: $crewNumber4).modifier(CrewNumbers())
                             .onSubmit { lastSubmit = crewNumber4
                                 if let focus = focus { self.focus = focus.next() } }
                             .focused($focus, equals: .crewNumber4)
                             .limitInputLength(value: $crewNumber4, length: 5)
                     }
                     HStack {
                         LabelView(label: "B -")
                         TextField("Number 4B", text: $cabincrew5).modifier(CrewDetails())
                             .onSubmit { lastSubmit = cabincrew5
                                 if let focus = focus { self.focus = focus.next() } }
                             .focused($focus, equals: .cabincrew5)
                             .limitInputLength(value: $cabincrew5, length: 12)
                         
                         TextField("12345", text: $crewNumber5).modifier(CrewNumbers())
                             .onSubmit { lastSubmit = crewNumber5
                                 if let focus = focus { self.focus = focus.next() } }
                             .focused($focus, equals: .crewNumber5)
                             .limitInputLength(value: $crewNumber5, length: 5)
                     }
                 } // VS
             } // SW
             .padding(.horizontal)
             Spacer()
             VStack {
                 Spacer()
 // MARK: - FOOTER
                 HStack {
                     clearButton()
                         .padding(.leading)
                     
                     Spacer()
                     
                     Image(systemName: "lock.fill")
                         .resizable()
                         .scaledToFit()
                         .frame(width: 40, height: 40)
                         .padding(.top)
                     
                     Spacer()
                     
                     Text("Update")
                         .padding(.trailing)
                 }
                 .foregroundColor(.accentColor)
                 .background(Color("tb"))
                 
             } // VS
             
         } // ZS
 // MARK: - TOOLBAR
         .toolbar {
             ToolbarItemGroup(placement: .keyboard) {
                 ChevronLeft().padding()
                 Spacer()
                 DoneButton()
                 Spacer()
                 ChevronRight().padding()
             }
         }
         .confirmationDialog("Are you sure you want to delete all the data?", isPresented: $showingAlert, titleVisibility: .visible) {
             Button("DELETE ALL", role: .destructive) { PersistentContainer.deleteBatch() }
         }
     }
     
 // MARK: - FUNCTIONS
     func clearButton() -> some View {
         Button(action: { showingAlert.toggle() }) {Text("Clear") }
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
         Button { focus = nil } label: { Image(systemName: "keyboard.chevron.compact.down") }
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
     func saveData() -> some View {
         Button(action: {
             
             Flightdata.updateData()
         }) {
             Text("Update")
         }
     }
 }

 // MARK: - PREVIEW

 struct SingleView_Previews: PreviewProvider {
     static var viewContext = PersistentContainer.persistentContainer.viewContext
     static var previews: some View {
         let f = Flightdata(context: viewContext)
         f.destination1 = "CUN"
         
         return SingleView()
             .preferredColorScheme(.dark)
             .environment(\.managedObjectContext, PersistentContainer.persistentContainer.viewContext)
     }
 }
 */
