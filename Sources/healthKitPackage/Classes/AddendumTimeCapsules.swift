//
//  File.swift
//  
//
//  Created by Klaus-Dieter Reiners on 21.04.22.
//

import Foundation
public class AddendumTimeCapsules: TimeCapsule {
    public typealias T = Addendum
    public init(resolution: Double) {

        super.init(resolution: resolution, logKey: "timestamp", valueKey: "name", device: "Watch", quantityTypeKeyPath:"addendum2addendumtype.name", items: AddendumModel().items)
        super.slicer()
    }
}
