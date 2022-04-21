//
//  File.swift
//  
//
//  Created by Klaus-Dieter Reiners on 21.04.22.
//

import Foundation
import CoreData
public class TimeCapsule<T>: GenericTimeCapsule where T: NSManagedObject {
    public var slices: [slice] = []
    public var sliceStartDate: Date
    public var sliceEndDate: Date
    public var resolution: Double
    public var predecessors: Array<slice>! = nil
    public var successor: Array<slice>! = nil
    public struct slice {
        public var quantityType: String
        public var source: String
        public var device: String
        public var dateInterval: DateInterval
        public var startDate: Date
        public var endDate: Date
    }
    init(resolution: Double, logKey: String, model: Model<T>) {
        
        sliceStartDate = (model.items.first!.value(forKey: logKey) as? Date)!
        sliceEndDate = (model.items.last!.value(forKey: logKey) as? Date)!
        self.resolution = resolution
    }
}

