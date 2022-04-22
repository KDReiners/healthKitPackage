//
//  File.swift
//  
//
//  Created by Klaus-Dieter Reiners on 21.04.22.
//

import Foundation
public class AddendumTimeCapsules: TimeCapsule<Addendum> {
    public typealias T = Addendum
    public init(resolution: Double) {
        var filter = recordFilter(columnKeyPath: "recordingtype", filterValue: "0")
        super.init(resolution: resolution, logKey: "timestamp", valueKey: "name", device: "Watch", quantityTypeKeyPath:"addendum2addendumtype.name", model: AddendumModel(), filter: filter)
        super.slicer()
    }
}
