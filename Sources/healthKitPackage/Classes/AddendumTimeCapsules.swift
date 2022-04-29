//
//  File.swift
//  
//
//  Created by Klaus-Dieter Reiners on 21.04.22.
//

import Foundation
public class AddendumTimeCapsules: TimeCapsule<Addendum> {
    public typealias T = Addendum
    public required init(resolution: Double, quantityType: String = "") {

        super.init(resolution: resolution)
        super.load(logKey: "timestamp", valueKey: "name", device: "Watch", quantityTypeKeyPath:"addendum2addendumtype.name", items: AddendumModel().items)
        super.slicer()
    }
}
