//
//  File.swift
//  
//
//  Created by Klaus-Dieter Reiners on 22.04.22.
//

import Foundation
import CoreData
import SwiftUI
public class Libre3TimeCapsules: TimeCapsule<Libre3primanota> {
    let model = Libre3Model()
    var scannedRecordTypes: [libreRecordType]! = nil
    struct libreRecordType {
        var valueKey: String
        var quantityTypeKeyPath: String
        var filteredItems: [NSManagedObject]
    }
    public required init(resolution: Double, quantityType: String) {
        super.init(resolution: resolution)
        scannedRecordTypes = fillRecordTypes()
        load()
    }
    private func load() {
        scannedRecordTypes.forEach { type in
            super.load(logKey: "devicetimestamp", valueKey: type.valueKey, device: "Libre3", quantityTypeKeyPath: type.quantityTypeKeyPath, items: type.filteredItems)
            super.slicer()
        }
    }
    private func fillRecordTypes() -> [libreRecordType] {
        var result = [libreRecordType]()
        
        // Glucosespathway
        var newRecordType = libreRecordType(valueKey: "glucosespathway", quantityTypeKeyPath: "Glucose", filteredItems: getManagedObjects(recordingType: 0))
        result.append(newRecordType)
        
        // User Observation
        newRecordType = libreRecordType(valueKey: "glucosescan", quantityTypeKeyPath: "UserGlucoseScan", filteredItems: getManagedObjects(recordingType: 1)) // User Observation
        result.append(newRecordType)
        
        // Depot Insulin
        newRecordType = libreRecordType(valueKey: "depotinsulinunits", quantityTypeKeyPath: "depotInsulinUnits", filteredItems: getManagedObjects(recordingType: 4))
        result.append(newRecordType)
        
        // Rapid Insulin
        newRecordType = libreRecordType(valueKey: "rapidactinginsulin", quantityTypeKeyPath: "rapidactinginsulinUnits", filteredItems: getManagedObjects(recordingType: 4))
        result.append(newRecordType)
        // Nutrition
        newRecordType = libreRecordType(valueKey: "nonnumericfooddata", quantityTypeKeyPath: "Nutrition", filteredItems: getManagedObjects(recordingType: 5))
        result.append(newRecordType)
        // Notes
        newRecordType = libreRecordType(valueKey: "notes", quantityTypeKeyPath: "Notes", filteredItems: getManagedObjects(recordingType: 6))
        result.append(newRecordType)
        
        return result
    }
    private func getManagedObjects(recordingType: Int) -> [NSManagedObject] {
        return model.items.filter { item in
            return (item.recordingtype == recordingType) == true
        }
    }
}
