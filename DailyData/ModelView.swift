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
                        Text("Destination: ").modifier(Labels())
                        HStack {
                            TextField("ZRH", text: $destination1).modifier(DayDetails())
                                .onSubmit { lastSubmit = destination1
                                    if let focus = focus { self.focus = focus.next() } }
                                .focused($focus, equals: .destination1)
                                .limitInputLength(value: $destination1, length: 3)
                            Text("-").modifier(Labels())
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
                        Text("AC Registration: ").modifier(Labels())
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
                        Text("Flight Nº").modifier(Labels())
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
                        Text("ETD").modifier(Labels())
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
                        Text("ETA").modifier(Labels())
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
                        Text("PAX").modifier(Labels())
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
                Text("CREW").modifier(Labels())
                VStack(spacing: 20) {
                    HStack {
                        Text("C - ").modifier(Labels())
                        TextField("Flight crew 1", text: $flightcrew1).modifier(CrewDetails())
                            .onSubmit { lastSubmit = flightcrew1
                                if let focus = focus { self.focus = focus.next() } }
                            .focused($focus, equals: .flightcrew1)
                    }
                    HStack {
                        Text("F - ").modifier(Labels())
                        TextField("Flight crew 2", text: $flightcrew2).modifier(CrewDetails())
                            .onSubmit { lastSubmit = flightcrew2
                                if let focus = focus { self.focus = focus.next() } }
                            .focused($focus, equals: .flightcrew2)
                    }
                    HStack {
                        Text("2 - ").modifier(Labels())
                        TextField("Cabin crew 2", text: $cabincrew2).modifier(CrewDetails())
                            .onSubmit { lastSubmit = cabincrew2
                                if let focus = focus { self.focus = focus.next() } }
                            .focused($focus, equals: .cabincrew2)
                    }
                    HStack {
                        Text("3 - ").modifier(Labels())
                        TextField("Cabin crew 3", text: $cabincrew3).modifier(CrewDetails())
                            .onSubmit { lastSubmit = cabincrew3
                                if let focus = focus { self.focus = focus.next() } }
                            .focused($focus, equals: .cabincrew3)
                    }
                    HStack {
                        Text("4 - ").modifier(Labels())
                        TextField("Cabin crew 4", text: $cabincrew4).modifier(CrewDetailsDone())
                            .onSubmit { lastSubmit = cabincrew4
                                if let focus = focus { self.focus = focus.next() } }
                            .focused($focus, equals: .cabincrew4)
                    }
                    HStack {
                        Text("B - ").modifier(Labels())
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
            .onAppear {
                let appearance = UINavigationBarAppearance()
                appearance.backgroundColor = UIColor(Color("tb"))
                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) { SaveButton() }
                ToolbarItemGroup(placement: .keyboard) {
                    Button {
                        if let focus = focus {
                            self.focus = focus.previous()
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                    }.disabled(!hasPreviousTextField)
                    Spacer()
                    Button { focus = nil } label: { Text("Done") }
                    Spacer()
                    Button {
                        if let focus = focus { self.focus = focus.next() }
                    } label: {
                        Image(systemName: "chevron.right")
                    }.disabled(!hasNextTextField)
                }
            }
        } // NV
        .navigationViewStyle(.stack)
    } // BY
// MARK: - FUNCTIONS

    func SaveButton() -> some View {
        Button {
            let newData = Flightdata(context: moc)
            newData.destination1 = destination1
            newData.destination2 = destination2
            newData.registration = registration
            newData.flight1 = flight1
            newData.departure1 = departure1
            newData.arrival1 = arrival1
            newData.pax1 = pax1
            newData.flight2 = flight2
            newData.departure2 = departure2
            newData.arrival2 = arrival2
            newData.pax2 = pax2
            newData.flight3 = flight3
            newData.departure3 = departure3
            newData.arrival3 = arrival3
            newData.pax3 = pax3
            newData.flight4 = flight4
            newData.departure4 = departure4
            newData.arrival4 = arrival4
            newData.pax4 = pax4
            newData.flightcrew1 = flightcrew1
            newData.flightcrew2 = flightcrew2
            newData.cabincrew2 = cabincrew2
            newData.cabincrew3 = cabincrew3
            newData.cabincrew4 = cabincrew4
            newData.cabincrew5 = cabincrew5
            PersistentContainer.saveContext()
            dismiss()
        } label: {
            Text("Save")
        }.disabled(destination1.isEmpty)
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
            ModelView()
            ModelView().preferredColorScheme(.dark)
        }
    }
}


