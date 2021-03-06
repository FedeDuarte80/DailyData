import SwiftUI

struct FlightDatas: Codable, Identifiable {
    var id: Int
    var destination1: String
    var destination2: String
    var registration: String
    var flight1: String
    var flight2: String
    var flight3: String
    var flight4: String
    var departure1: String
    var departure2: String
    var departure3: String
    var departure4: String
    var arrival1: String
    var arrival2: String
    var arrival3: String
    var arrival4: String
    var pax1: String
    var pax2: String
    var pax3: String
    var pax4: String
    var flightcrew1: String
    var flightcrew2: String
    var cabincrew2: String
    var cabincrew3: String
    var cabincrew4: String
    var cabincrew5: String
    var flightNumber1: String
    var flightNumber2: String
    var crewNumber2: String
    var crewNumber3: String
    var crewNumber4: String
    var crewNumber5: String
}

var flightList = [
    
    FlightDatas(
        id: 1001,
        destination1: "IBZ",
        destination2: "MAH",
        registration: "MAN / JSY",
        flight1: "1234",
        flight2: "1234",
        flight3: "1234",
        flight4: "1234",
        departure1: "5678",
        departure2: "5678",
        departure3: "5678",
        departure4: "5678",
        arrival1: "9012",
        arrival2: "9012",
        arrival3: "9012",
        arrival4: "9012",
        pax1: "123",
        pax2: "123",
        pax3: "123",
        pax4: "123",
        flightcrew1: "captain",
        flightcrew2: "firstoffice",
        cabincrew2: "number2",
        cabincrew3: "number3",
        cabincrew4: "number4",
        cabincrew5: "numberB",
        flightNumber1: "12345",
        flightNumber2: "12345",
        crewNumber2: "12345",
        crewNumber3: "12345",
        crewNumber4: "12345",
        crewNumber5: "12345"
    )
]
