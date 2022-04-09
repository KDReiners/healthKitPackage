//
//  Libre3primanota+CoreDataProperties.swift
//  
//
//  Created by Klaus-Dieter Reiners on 09.04.22.
//
//

import Foundation
import CoreData


extension Libre3primanota {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Libre3primanota> {
        return NSFetchRequest<Libre3primanota>(entityName: "Libre3primanota")
    }

    @NSManaged public var carbohydratesservings: Int16
    @NSManaged public var carbohydratesunits: Int16
    @NSManaged public var correctioninsulinunits: Int16
    @NSManaged public var depotinsulinunits: Int16
    @NSManaged public var device: String?
    @NSManaged public var devicetimestamp: Date?
    @NSManaged public var glucosescan: Double
    @NSManaged public var glucosespathway: Double
    @NSManaged public var glucoseteststrips: Int16
    @NSManaged public var insulinchangebyuserUnits: Int16
    @NSManaged public var ketoneunits: Int16
    @NSManaged public var mealinsulinunits: Int16
    @NSManaged public var nonnumericdepotinsulin: Bool
    @NSManaged public var nonnumericfooddata: Bool
    @NSManaged public var nonnumericrapidactinginsulin: Bool
    @NSManaged public var notes: String?
    @NSManaged public var rapidactinginsulin: Int16
    @NSManaged public var recordingtype: Int16
    @NSManaged public var serialnumber: String?

}
