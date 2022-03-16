//
//  Addendumtype+CoreDataProperties.swift
//  healthKitPackage
//
//  Created by Klaus-Dieter Reiners on 16.03.22.
//
//

import Foundation
import CoreData


extension Addendumtype {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Addendumtype> {
        return NSFetchRequest<Addendumtype>(entityName: "Addendumtype")
    }

    @NSManaged public var name: String?
    @NSManaged public var addendumtype2addendums: NSSet?

}

// MARK: Generated accessors for addendumtype2addendums
extension Addendumtype {

    @objc(addAddendumtype2addendumsObject:)
    @NSManaged public func addToAddendumtype2addendums(_ value: Addendum)

    @objc(removeAddendumtype2addendumsObject:)
    @NSManaged public func removeFromAddendumtype2addendums(_ value: Addendum)

    @objc(addAddendumtype2addendums:)
    @NSManaged public func addToAddendumtype2addendums(_ values: NSSet)

    @objc(removeAddendumtype2addendums:)
    @NSManaged public func removeFromAddendumtype2addendums(_ values: NSSet)

}
