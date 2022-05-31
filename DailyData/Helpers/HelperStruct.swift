import SwiftUI

struct HelperStruct: View {
    var body: some View {
        VStack {
            FlightsView(a: "Flight Nº", b: "STD", c: "STA", d: "PAX")
            FlightsView(a: "1234", b: "5678", c: "9012", d: "345")
            FlightsView(a: "1234", b: "5678", c: "9012", d: "345")
            FlightsView(a: "1234", b: "5678", c: "9012", d: "345")
            FlightsView(a: "1234", b: "5678", c: "9012", d: "345")
            CrewView(function: "2 - ", name: "Number 2", staff: "10999")
            LabelView(label: "Destination")
        }
        .padding(.horizontal)
    }
}
struct RegView: View {
    let dest1: String
    let dest2: String
    let reg: String
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Destination:").modifier(Labels())
                HStack {
                    Text(dest1)
                    Text(" - ")
                    Text(dest2)
                }
            }
            Spacer()
            VStack(alignment: .leading, spacing: 10) {
                Text("AC Registration:").modifier(Labels())
                HStack {
                    Text("EC - ").modifier(Labels())
                    Text(reg)
                }
            }
            Spacer()
        }
    }
}
struct FlightsView: View {
    let a: String
    let b: String
    let c: String
    let d: String
    let w: CGFloat = 70
    var body: some View {
        HStack {
            Text(a).frame(width: w)
            Spacer()
            Text(b).frame(width: w)
            Spacer()
            Text(c).frame(width: w)
            Spacer()
            Text(d).frame(width: w)
        }
    }
}
struct CrewView: View {
    let function: String
    let name: String
    let staff: String
    var body: some View {
        HStack {
            Text(function).modifier(Labels())
            Text(name)
            Spacer()
            Text(staff)
            
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

/*
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
 --
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
 */
