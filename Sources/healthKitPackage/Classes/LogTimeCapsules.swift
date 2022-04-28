//
//  File.swift
//
//
//  Created by Klaus-Dieter Reiners on 28.04.22.
//

import Foundation
import CoreData
import SwiftUI
public class LogTimeCapsules: TimeCapsule<Log> {
    let model = LogModel()
    public init(resolution: Double, quantityType: String) {
        super.init(resolution: resolution)
        load()
    }
    private func load() {
        model.items.forEach { log in
            super.load(logKey: "timeStamp", valueKey:"value" , device: "healthKit", quantityTypeKeyPath: "log2quantitytype", items: model.items)
            super.slicer()
        }
    }
}

