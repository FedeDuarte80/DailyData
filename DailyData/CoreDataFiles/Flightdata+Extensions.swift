
import Foundation
import CoreData

extension Flightdata {
    
    // 1
    public var destination1Name: String { destination1 ?? "" }
    public var destination2Name: String { destination2 ?? "" }
    public var registrationName: String { registration ?? "" }
    
    // 2
    public var flight1Name: String { flight1 ?? "" }
    public var flight2Name: String { flight2 ?? "" }
    public var flight3Name: String { flight3 ?? "" }
    public var flight4Name: String { flight4 ?? "" }
    
    // 3
    public var departure1Name: String { departure1 ?? "" }
    public var departure2Name: String { departure2 ?? "" }
    public var departure3Name: String { departure3 ?? "" }
    public var departure4Name: String { departure4 ?? "" }
    
    // 4
    public var arrival1Name: String { arrival1 ?? "" }
    public var arrival2Name: String { arrival2 ?? "" }
    public var arrival3Name: String { arrival3 ?? "" }
    public var arrival4Name: String { arrival4 ?? "" }
    
    // 5
    public var pax1Name: String { pax1 ?? "..." }
    public var pax2Name: String { pax2 ?? "..." }
    public var pax3Name: String { pax3 ?? "..." }
    public var pax4Name: String { pax4 ?? "..." }
    
    // 6
    public var flightcrew1Name: String { flightcrew1 ?? "" }
    public var flightcrew2Name: String { flightcrew2 ?? "" }
    public var cabincrew2Name: String { cabincrew2 ?? "" }
    public var cabincrew3Name: String { cabincrew3 ?? "" }
    public var cabincrew4Name: String { cabincrew4 ?? "" }
    public var cabincrew5Name: String { cabincrew5 ?? "" }
    
    // 7
    public var flightcrew1Number: String { flightNumber1 ?? "" }
    public var flightcrew2Number: String { flightNumber2 ?? "" }
    public var crew2Number: String { crewNumber2 ?? "" }
    public var crew3Number: String { crewNumber3 ?? "" }
    public var crew4Number: String { crewNumber4 ?? "" }
    public var crew5Number: String { crewNumber5 ?? "" }
    
}
extension Flightdata {
    
    static func getFlightdata() -> NSFetchRequest<Flightdata>{
        let request = Flightdata.fetchRequest() 
        request.sortDescriptors = []
        return request
    }
    
    class func addFlightsData(des1: String, des2: String, reg: String, fli1: String, dep1: String, arr1: String, pa1: String,  fli2: String, dep2: String, arr2: String, pa2: String,  fli3: String, dep3: String, arr3: String, pa3: String,  fli4: String, dep4: String, arr4: String, pa4: String, flig1: String, flig2: String, cab2: String, cab3: String, cab4: String, cab5: String, num1: String, num12: String, num2: String, num3: String, num4: String, num5: String
    ) {
        let newData = Flightdata(context: PersistentContainer.context)
        newData.destination1 = des1
        newData.destination2 = des2
        newData.registration = reg
        newData.flight1 = fli1
        newData.departure1 = dep1
        newData.arrival1 = arr1
        newData.pax1 = pa1
        newData.flight2 = fli2
        newData.departure2 = dep2
        newData.arrival2 = arr2
        newData.pax2 = pa2
        newData.flight3 = fli3
        newData.departure3 = dep3
        newData.arrival3 = arr3
        newData.pax3 = pa3
        newData.flight4 = fli4
        newData.departure4 = dep4
        newData.arrival4 = arr4
        newData.pax4 = pa4
        newData.flightcrew1 = flig1
        newData.flightcrew2 = flig2
        newData.cabincrew2 = cab2
        newData.cabincrew3 = cab3
        newData.cabincrew4 = cab4
        newData.cabincrew5 = cab5
        newData.flightNumber1 = num1
        newData.flightNumber2 = num12
        newData.crewNumber2 = num2
        newData.crewNumber3 = num3
        newData.crewNumber4 = num4
        newData.crewNumber5 = num5
        PersistentContainer.saveContext()
    }
    static func loadSeedData(into context: NSManagedObjectContext) {
        for flights in flightList {
            let newData = Flightdata(context: context)
            newData.destination1 = flights.destination1
            newData.destination2 = flights.destination2
            newData.registration = flights.registration
            newData.flight1 = flights.flight1
            newData.flight2 = flights.flight2
            newData.flight3 = flights.flight3
            newData.flight4 = flights.flight4
            newData.departure1 = flights.departure1
            newData.departure2 = flights.departure2
            newData.departure3 = flights.departure3
            newData.departure4 = flights.departure4
            newData.arrival1 = flights.arrival1
            newData.arrival2 = flights.arrival2
            newData.arrival3 = flights.arrival3
            newData.arrival4 = flights.arrival4
            newData.pax1 = flights.pax1
            newData.pax2 = flights.pax2
            newData.pax3 = flights.pax3
            newData.pax4 = flights.pax4
            newData.flightcrew1 = flights.flightcrew1
            newData.flightcrew2 = flights.flightcrew2
            newData.cabincrew2 = flights.cabincrew2
            newData.cabincrew3 = flights.cabincrew3
            newData.cabincrew4 = flights.cabincrew4
            newData.cabincrew5 = flights.cabincrew5
        }
        PersistentContainer.saveContext()
        print("Loading seed data")
    }
}
    
