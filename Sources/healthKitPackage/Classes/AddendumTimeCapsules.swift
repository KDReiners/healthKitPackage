//
//  File.swift
//  
//
//  Created by Klaus-Dieter Reiners on 21.04.22.
//

import Foundation
public class AddendumTimeCapsules: TimeCapsule<Addendum> {
    public typealias T = Addendum
    init(resolution: Double) {
        super.init(resolution: resolution, logKey: "deviceTimeStamp", model: AddendumModel())
    }
}