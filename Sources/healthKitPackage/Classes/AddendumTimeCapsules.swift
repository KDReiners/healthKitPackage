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
        super.init(resolution: resolution, logKey: "timestamp", valueKey: "name", model: AddendumModel())
        super.slicer()
    }
}
