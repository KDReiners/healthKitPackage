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
    public var model: Model<T>
    public var sliceStartDate: Date
    public var sliceEndDate: Date
    public var resolution: Double
    public var predecessors: Array<slice>! = nil
    public var successor: Array<slice>! = nil
    public var logKey: String
    public var valueKey: String
    public var quantityTypeKeyPath: String
    public struct slice {
        public var quantityType: String
        public var source: String
        public var device: String
        public var queryDateInterval: DateInterval
        public var sliceDateInterval: DateInterval
        public var logDate: Date
        public var value: Any
    }
    public init(resolution: Double, logKey: String, valueKey: String, device: String, quantityTypeKeyPath: String, model: Model<T>) {
        sliceStartDate = (model.items.first!.value(forKey: logKey) as! Date)
        sliceEndDate = (model.items.last!.value(forKey: logKey) as! Date)
        if sliceEndDate < sliceStartDate {
            let newEndDate = sliceStartDate
            sliceStartDate = sliceEndDate
            sliceEndDate = newEndDate
        }
        self.resolution = resolution
        self.model = model
        self.logKey = logKey
        self.valueKey = valueKey
        self.quantityTypeKeyPath = quantityTypeKeyPath
    }
    public func slicer() -> Void {
        var loopStartDate = self.sliceStartDate
        var loopEndDate = loopStartDate.addingTimeInterval(resolution)
        while loopEndDate <= sliceEndDate {
            model.items.filter { item in
                return ((item.value(forKey: self.logKey) as! Date) >= loopStartDate && (item.value(forKey: self.logKey) as! Date) < loopEndDate) == true
                
            }.forEach { item in
                let itemDate = item.value(forKey: self.logKey) as! Date
                let itemValue = item.value(forKey: self.valueKey)
                let  quantityType = ((self.quantityTypeKeyPath.contains(".") == true) ? item.value(forKeyPath: self.quantityTypeKeyPath) : self.quantityTypeKeyPath) as! String
                let newSlice = slice(quantityType: quantityType, source: "", device: "", queryDateInterval: DateInterval(start: self.sliceStartDate, end: self.sliceEndDate), sliceDateInterval: DateInterval(start: loopStartDate, end: loopEndDate),  logDate: itemDate, value: itemValue ?? "")
                    self.slices.append(newSlice)
                
            }
            loopStartDate = loopStartDate.addingTimeInterval(resolution)
            loopEndDate = loopStartDate.addingTimeInterval(resolution)
        }
    }
}

