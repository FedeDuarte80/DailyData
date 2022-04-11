
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
    
    class func addFlightsData(des1: String, des2: String, reg: String, fli1: String, dep1: String, arr1: String, pa1: String,  fli2: String, dep2: String, arr2: String, pa2: String,  fli3: String, dep3: String, arr3: String, pa3: String,  fli4: String, dep4: String, arr4: String, pa4: String, flig1: String, flig2: String, cab2: String, cab3: String, cab4: String, cab5: String) {
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
        PersistentContainer.saveContext()
    }
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


    
