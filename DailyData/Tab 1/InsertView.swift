//  Created by Fede Duarte on 12/4/22.

import SwiftUI

struct InsertView: View {
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
                HStack {
// MARK: - DESTINATION
                    VStack(alignment: .leading) {
                        LabelView(label: "Destination: ")
                        HStack {
                            TextField("", text: $destination1).modifier(DayDetails())
                                .onSubmit { lastSubmit = destination1
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .destination1)
                                .limitInputLength(value: $destination1, length: 3)
                            
                            LabelView(label: "-")
                            
                            TextField("", text: $destination2).modifier(DayDetails())
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
                            
                            TextField("", text: $registration).modifier(regDetails())
                                .onSubmit { lastSubmit = registration
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .registration)
                                .limitInputLength(value: $registration, length: 9)
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
                            
                        TextField("", text: $flight1)
                                .onSubmit { lastSubmit = flight1
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .flight1)
                                .limitInputLength(value: $flight1, length: 4)
                            
                        TextField("", text: $flight2)
                                .onSubmit { lastSubmit = flight2
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .flight2)
                                .limitInputLength(value: $flight2, length: 4)
                            
                        TextField("", text: $flight3)
                                .onSubmit { lastSubmit = flight3
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .flight3)
                                .limitInputLength(value: $flight3, length: 4)
                            
                        TextField("", text: $flight4)
                                .onSubmit { lastSubmit = flight4
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .flight4)
                                .limitInputLength(value: $flight4, length: 4)
                            
                        }.modifier(FlightsDetails())
                    } // VS
                    VStack(spacing: 14) {
                        LabelView(label: "STD")
                        VStack(spacing: 14) {
                        TextField("", text: $departure1)
                                .onSubmit { lastSubmit = departure1
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .departure1)
                                .limitInputLength(value: $departure1, length: 4)
                            
                        TextField("", text: $departure2)
                                .onSubmit { lastSubmit = departure2
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .departure2)
                                .limitInputLength(value: $departure2, length: 4)
                            
                        TextField("", text: $departure3)
                                .onSubmit { lastSubmit = departure3
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .departure3)
                                .limitInputLength(value: $departure3, length: 4)
                            
                        TextField("", text: $departure4)
                                .onSubmit { lastSubmit = departure4
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .departure4)
                                .limitInputLength(value: $departure4, length: 4)
                            
                        }.modifier(FlightsDetails())
                    } // VS
                    VStack(spacing: 14) {
                        LabelView(label: "STA")
                        VStack(spacing: 14) {
                        TextField("", text: $arrival1)
                                .onSubmit { lastSubmit = arrival1
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .arrival1)
                                .limitInputLength(value: $arrival1, length: 4)
                            
                        TextField("", text: $arrival2)
                                .onSubmit { lastSubmit = arrival2
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .arrival2)
                                .limitInputLength(value: $arrival2, length: 4)
                            
                        TextField("", text: $arrival3)
                                .onSubmit { lastSubmit = arrival3
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .arrival3)
                                .limitInputLength(value: $arrival3, length: 4)
                            
                        TextField("", text: $arrival4)
                                .onSubmit { lastSubmit = arrival4
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .arrival4)
                                .limitInputLength(value: $arrival4, length: 4)
                            
                        }.modifier(FlightsDetails())
                    } // VS
                    VStack(spacing: 14) {
                        LabelView(label: "PAX")
                        VStack(spacing: 14) {
                        TextField("", text: $pax1)
                                .onSubmit { lastSubmit = pax1
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .pax1)
                                .limitInputLength(value: $pax1, length: 3)
                            
                        TextField("", text: $pax2)
                                .onSubmit { lastSubmit = pax2
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .pax2)
                                .limitInputLength(value: $pax2, length: 3)
                            
                        TextField("", text: $pax3)
                                .onSubmit { lastSubmit = pax3
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .pax3)
                                .limitInputLength(value: $pax3, length: 3)
                            
                        TextField("", text: $pax4)
                                .onSubmit { lastSubmit = pax4
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .pax4)
                                .limitInputLength(value: $pax4, length: 3)
                            
                        }.modifier(FlightsDetails())
                    } // VS
                } // HS
                Divider().padding(.vertical, 5)
// MARK: - CREW
                VStack(spacing: 20) {
                    HStack {
                        LabelView(label: "C - ")
                        TextField("", text: $flightcrew1).modifier(CrewDetails())
                            .onSubmit { lastSubmit = flightcrew1
                                if let focus = focus { self.focus = focus.next() } }
                            .focused($focus, equals: .flightcrew1)
                        TextField("", text: $flightNumber1).modifier(CrewNumbers())
                            .onSubmit { lastSubmit = flightNumber1
                                if let focus = focus { self.focus = focus.next() } }
                            .focused($focus, equals: .flightNumber1)
                            .limitInputLength(value: $flightNumber1, length: 5)
                    }
                    HStack {
                        LabelView(label: "F - ")
                        TextField("", text: $flightcrew2).modifier(CrewDetails())
                            .onSubmit { lastSubmit = flightcrew2
                                if let focus = focus { self.focus = focus.next() } }
                            .focused($focus, equals: .flightcrew2)
                        TextField("", text: $flightNumber2).modifier(CrewNumbers())
                            .onSubmit { lastSubmit = flightNumber2
                                if let focus = focus { self.focus = focus.next() } }
                            .focused($focus, equals: .flightNumber2)
                            .limitInputLength(value: $flightNumber2, length: 5)
                    }
                    HStack {
                        LabelView(label: "2 - ")
                        TextField("", text: $cabincrew2).modifier(CrewDetails())
                            .onSubmit { lastSubmit = cabincrew2
                                if let focus = focus { self.focus = focus.next() } }
                            .focused($focus, equals: .cabincrew2)
                        TextField("", text: $crewNumber2).modifier(CrewNumbers())
                            .onSubmit { lastSubmit = crewNumber2
                                if let focus = focus { self.focus = focus.next() } }
                            .focused($focus, equals: .crewNumber2)
                            .limitInputLength(value: $crewNumber2, length: 5)
                    }
                    HStack {
                        LabelView(label: "3 - ")
                        TextField("", text: $cabincrew3).modifier(CrewDetails())
                            .onSubmit { lastSubmit = cabincrew3
                                if let focus = focus { self.focus = focus.next() } }
                            .focused($focus, equals: .cabincrew3)
                        TextField("", text: $crewNumber3).modifier(CrewNumbers())
                            .onSubmit { lastSubmit = crewNumber3
                                if let focus = focus { self.focus = focus.next() } }
                            .focused($focus, equals: .crewNumber3)
                            .limitInputLength(value: $crewNumber3, length: 5)
                    }
                    HStack {
                        LabelView(label: "4 - ")
                        TextField("", text: $cabincrew4).modifier(CrewDetailsDone())
                            .onSubmit { lastSubmit = cabincrew4
                                if let focus = focus { self.focus = focus.next() } }
                            .focused($focus, equals: .cabincrew4)
                        TextField("", text: $crewNumber4).modifier(CrewNumbersDone())
                            .onSubmit { lastSubmit = crewNumber4
                                if let focus = focus { self.focus = focus.next() } }
                            .focused($focus, equals: .crewNumber4)
                            .limitInputLength(value: $crewNumber4, length: 5)
                    }
                    HStack {
                        LabelView(label: "B - ")
                        TextField("", text: $cabincrew5).modifier(CrewDetailsDone())
                            .onSubmit { lastSubmit = cabincrew5
                                if let focus = focus { self.focus = focus.next() } }
                            .focused($focus, equals: .cabincrew5)
                        TextField("", text: $crewNumber5).modifier(CrewNumbersDone())
                            .onSubmit { lastSubmit = crewNumber5
                                if let focus = focus { self.focus = focus.next() } }
                            .focused($focus, equals: .crewNumber5)
                            .limitInputLength(value: $crewNumber5, length: 5)
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
                    ChevronLeft().padding()
                    Spacer()
                    DoneButton()
                    Spacer()
                    ChevronRight().padding()
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
            PersistentContainer.deleteBatch()
            Flightdata.addFlightsData(
                des1: destination1, des2: destination2, reg: registration,
                fli1: flight1, dep1: departure1, arr1: arrival1, pa1: pax1,
                fli2: flight2, dep2: departure2, arr2: arrival2, pa2: pax2,
                fli3: flight3, dep3: departure3, arr3: arrival3, pa3: pax3,
                fli4: flight4, dep4: departure4, arr4: arrival4, pa4: pax4,
                flig1: flightcrew1, flig2: flightcrew2, cab2: cabincrew2, cab3: cabincrew3, cab4: cabincrew4, cab5: cabincrew5,
                num1: flightNumber1, num12: flightNumber2, num2: crewNumber2, num3: crewNumber3, num4: crewNumber4, num5: crewNumber5
            )
            
            self.destination1 = ""
            self.destination2 = ""
            self.registration = ""
            self.flight1 = ""
            self.departure1 = ""
            self.arrival1 = ""
            self.pax1 = ""
            self.flight2 = ""
            self.departure2 = ""
            self.arrival2 = ""
            self.pax2 = ""
            self.flight3 = ""
            self.departure3 = ""
            self.arrival3 = ""
            self.pax3 = ""
            self.flight4 = ""
            self.departure4 = ""
            self.arrival4 = ""
            self.pax4 = ""
            self.flightcrew1 = ""
            self.flightcrew2 = ""
            self.cabincrew2 = ""
            self.cabincrew3 = ""
            self.cabincrew4 = ""
            self.cabincrew5 = ""
            self.flightNumber1 = ""
            self.flightNumber2 = ""
            self.crewNumber2 = ""
            self.crewNumber3 = ""
            self.crewNumber4 = ""
            self.crewNumber5 = ""
            
            focus = nil 
        }) {
            Text("Send")
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
}

struct InsertView_Previews: PreviewProvider {
    static var previews: some View {
        InsertView().preferredColorScheme(.dark)
    }
}
