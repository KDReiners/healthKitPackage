//
//  File.swift
//  
//
//  Created by Klaus-Dieter Reiners on 24.04.22.
//

import Foundation
public struct Slice: Hashable {
    public var ID = UUID()
    public var quantityType: String
    public var source: String
    public var device: String
    public var queryDateInterval: DateInterval
    public var sliceDateInterval: DateInterval
    public var logDate: Date
    public var value: Any
    
    public static func == (lhs: Slice, rhs: Slice) -> Bool {
        return lhs.hashValue == rhs.hashValue 
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ID)
    }
}
