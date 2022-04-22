//
//  File.swift
//  
//
//  Created by Klaus-Dieter Reiners on 22.04.22.
//

import Foundation
public class Libre3TimeCapsules: TimeCapsule<Libre3primanota> {
    public typealias T = Libre3primanota
    public init(resolution: Double) {
        super.init(resolution: resolution, logKey: "devicetimestamp", valueKey: "glucosespathway", device: "Libre3", quantityTypeKey: "Glucose",  model: Libre3Model())
        super.slicer()
    }
}
