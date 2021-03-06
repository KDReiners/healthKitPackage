//
//  Addendum+CoreDataProperties.swift
//  
//
//  Created by Klaus-Dieter Reiners on 16.04.22.
//
//

import Foundation
import CoreData


extension Addendum {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Addendum> {
        return NSFetchRequest<Addendum>(entityName: "Addendum")
    }

    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var name: String?
    @NSManaged public var timestamp: Date?
    @NSManaged public var addendum2addendumtype: Addendumtype?

}
