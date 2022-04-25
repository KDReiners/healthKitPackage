//
//  File.swift
//  
//
//  Created by Klaus-Dieter Reiners on 24.04.22.
//

import Foundation
public struct Slice {
    public var ID = UUID()
    public var quantityType: String
    public var source: String
    public var device: String
    public var queryDateInterval: DateInterval
    public var sliceDateInterval: DateInterval
    public var logDate: Date
    public var value: Any
}
