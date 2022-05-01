//
//  File.swift
//  
//
//  Created by Klaus-Dieter Reiners on 24.04.22.
//

import Foundation
import SwiftUI
public class Slice: Identifiable, Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine([quantityType, source, device, DateFormatter().string(from: sliceDateInterval.start)])
    }
    public static func == (lhs: Slice, rhs: Slice) -> Bool {
            return
        lhs.quantityType ==  rhs.quantityType &&
        lhs.source == rhs.source &&
        lhs.device == rhs.device &&
        lhs.queryDateInterval == rhs.queryDateInterval &&
        lhs.sliceDateInterval == rhs.sliceDateInterval &&
        lhs.logDate == rhs.logDate &&
        BaseServices.tryCast( lhs.value) == BaseServices.tryCast(_: rhs.value)
    }
    public var quantityType: String
    public var source: String
    public var device: String
    public var queryDateInterval: DateInterval
    public var sliceDateInterval: DateInterval
    public var logDate: Date
    public var value: Any
    init(quantityType: String, source: String, device: String, queryDateinterval: DateInterval, sliceDateInterval: DateInterval, logDate: Date, value: Any) {
        self.quantityType = quantityType
        self.source = source
        self.device = device
        self.queryDateInterval = queryDateinterval
        self.sliceDateInterval = sliceDateInterval
        self.logDate = logDate
        self.value = value
    }
    
}
