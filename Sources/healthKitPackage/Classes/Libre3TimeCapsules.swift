//
//  File.swift
//  
//
//  Created by Klaus-Dieter Reiners on 22.04.22.
//

import Foundation
public class Libre3TimeCapsules: TimeCapsule {
    public typealias T = Libre3primanota
    public init(resolution: Double, quantityType: String) {
        let model = Libre3Model()
        getRecordTypes(recordingType: 0, valueKey:  "glucosespathway", quantityTypeKeyPath:  "Glucose", model: model)
    }
    private func getRecordTypes(recordingType: Int16, valueKey: String, quantityTypeKeyPath: String, model: Model<Libre3Model>) -> Void{
        var filteredItems = model.items.filter { item in
            return (item.recordingtype == 0) == true
        }
        super.init(resolution: resolution, logKey: "devicetimestamp", valueKey: "glucosespathway", device: "Libre3", quantityTypeKeyPath: "Glucose",  items: filteredItems)
        super.slicer()
    }
}
//0 = glucoseverlauf
//1 = Wann hat der User geschaut
//4 = Insulin
//5 = Nahrung
//6 = Notizen
