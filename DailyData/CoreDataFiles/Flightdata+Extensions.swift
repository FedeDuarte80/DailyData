
import Foundation
import CoreData

extension Flightdata {
    
    // 1
    public var destination1Name: String { destination1 ?? "ZRH" }
    public var destination2Name: String { destination2 ?? "AGP" }
    public var registrationName: String { registration ?? "JSY" }
    
    // 2
    public var flight1Name: String { flight1 ?? "1234" }
    public var flight2Name: String { flight2 ?? "1234" }
    public var flight3Name: String { flight3 ?? "1234" }
    public var flight4Name: String { flight4 ?? "1234" }
    
    // 3
    public var departure1Name: String { departure1 ?? "5678" }
    public var departure2Name: String { departure2 ?? "5678" }
    public var departure3Name: String { departure3 ?? "5678" }
    public var departure4Name: String { departure4 ?? "5678" }
    
    // 4
    public var arrival1Name: String { arrival1 ?? "9012" }
    public var arrival2Name: String { arrival2 ?? "9012" }
    public var arrival3Name: String { arrival3 ?? "9012" }
    public var arrival4Name: String { arrival4 ?? "9012" }
    
    // 5
    public var pax1Name: String { pax1 ?? "345" }
    public var pax2Name: String { pax2 ?? "345" }
    public var pax3Name: String { pax3 ?? "345" }
    public var pax4Name: String { pax4 ?? "345" }
    
    // 6
    public var flightcrew1Name: String { flightcrew1 ?? "FligthCrew1" }
    public var flightcrew2Name: String { flightcrew2 ?? "FligthCrew2" }
    public var cabincrew2Name: String { cabincrew2 ?? "CabinCrew2" }
    public var cabincrew3Name: String { cabincrew3 ?? "CabinCrew3" }
    public var cabincrew4Name: String { cabincrew4 ?? "CabinCrew4" }
    public var cabincrew5Name: String { cabincrew5 ?? "CabinCrew5" }
    
}
extension Flightdata {
    static func getFlightdata() -> NSFetchRequest<Flightdata>{
        let request = Flightdata.fetchRequest() 
        request.sortDescriptors = []
        return request
    }
    
//    static func deleteData() {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Flightdata")
//        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//        do {
//            try managedObjectContext?.executeRequest(batchDeleteRequest)
//        } catch {
//            print("Delete all data, didnt work")
//        }
//
//    }


    
}
/*
 public static func deleteContext () {
     let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Flightdata")
     let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
     do {
         try managedObjectContext!.executeRequest(batchDeleteRequest)
     } catch {
         print("Delete all data didnt work!")
     }
 }
 */
