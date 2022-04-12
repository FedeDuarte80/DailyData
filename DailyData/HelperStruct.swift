import SwiftUI

struct HelperStruct: View {
    var body: some View {
        VStack {
            DestinationView(dest1: "MAD", dest2: "DUB")
            RegistrationView(reg1: "JSY")
            FlightView(Label: "Flight Nº", a: "1234", b: "1234", c: "1234", d: "123")
            CrewView(function: "2 - ", name: "Number 2", opa: 1)
            LabelView(label: "Destination")
        }
    }
}

struct DestinationView: View {
    let dest1: String
    let dest2: String
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Destination:").modifier(Labels())
            HStack {
                Text(dest1)
                Text(" - ")
                Text(dest2)
            }
        }
    }
}
struct RegistrationView: View {
    let reg1: String
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("AC Registration: ").modifier(Labels())
            HStack {
                Text("EC - ").modifier(Labels())
                Text(reg1)
            }
        }
    }
}
struct FlightView: View {
    let Label: String
    let a: String
    let b: String
    let c: String
    let d: String
    var body: some View {
        VStack(spacing: 24) {
            Text(Label).modifier(Labels())
            VStack(spacing: 24) {
                Text(a)
                Text(b)
                Text(c)
                Text(d)
            }.frame(width: 65)
        }
    }
}
struct CrewView: View {
    let function: String
    let name: String
    let opa: Double
    var body: some View {
        HStack {
            Text(function)
                .modifier(Labels())
                .opacity(opa)
            Text(name)
        }
    }
}
struct LabelView: View {
    let label: String
    var body: some View {
        Text(label).modifier(Labels())
    }
}

// MARK: - PREVIEW

struct HelperStruct_Previews: PreviewProvider {
    static var previews: some View {
        HelperStruct()
    }
}
