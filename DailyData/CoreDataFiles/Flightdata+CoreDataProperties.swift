//
//  Flightdata+CoreDataProperties.swift
//  DailyData
//
//  Created by Fede Duarte on 10/5/22.
//
//

import Foundation
import CoreData


extension Flightdata {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Flightdata> {
        return NSFetchRequest<Flightdata>(entityName: "Flightdata")
    }

    @NSManaged public var arrival1: String?
    @NSManaged public var arrival2: String?
    @NSManaged public var arrival3: String?
    @NSManaged public var arrival4: String?
    @NSManaged public var cabincrew2: String?
    @NSManaged public var cabincrew3: String?
    @NSManaged public var cabincrew4: String?
    @NSManaged public var cabincrew5: String?
    @NSManaged public var captain: String?
    @NSManaged public var departure1: String?
    @NSManaged public var departure2: String?
    @NSManaged public var departure3: String?
    @NSManaged public var departure4: String?
    @NSManaged public var destination1: String?
    @NSManaged public var destination2: String?
    @NSManaged public var flight1: String?
    @NSManaged public var flight2: String?
    @NSManaged public var flight3: String?
    @NSManaged public var flight4: String?
    @NSManaged public var flightcrew1: String?
    @NSManaged public var flightcrew2: String?
    @NSManaged public var pax1: String?
    @NSManaged public var pax2: String?
    @NSManaged public var pax3: String?
    @NSManaged public var pax4: String?
    @NSManaged public var registration: String?

}

extension Flightdata : Identifiable {

}
