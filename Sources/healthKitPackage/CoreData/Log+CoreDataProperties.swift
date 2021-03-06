//
//  Log+CoreDataProperties.swift
//  PackageTestMAC
//
//  Created by Klaus-Dieter Reiners on 05.03.22.
//
//

import Foundation
import CoreData


extension Log {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Log> {
        return NSFetchRequest<Log>(entityName: "Log")
    }

    @NSManaged public var maxValue: Double
    @NSManaged public var minValue: Double
    @NSManaged public var mostRecentDuration: Double
    @NSManaged public var mostRecentEndDate: Date?
    @NSManaged public var mostRecentStartDate: Date?
    @NSManaged public var mostRecentTimeInterval: Date?
    @NSManaged public var mostRecentValue: Double
    @NSManaged public var recentStartDate: Date?
    @NSManaged public var timeStamp: Date?
    @NSManaged public var uuid: UUID?
    @NSManaged public var value: Double
    @NSManaged public var log2Device: Device?
    @NSManaged public var log2quantitytype: Quantitytype?
    @NSManaged public var log2source: Source?

}

extension Log : Identifiable {

}
