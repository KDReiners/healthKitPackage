//
//  BaseServices.swift
//  healthKitShaman
//
//  Created by Klaus-Dieter Reiners on 19.11.21.
//

import Foundation
import OSLog
import CoreData
public struct BaseServices
{
    public static let logger = {
        return Logger()
    }()
    public static let standardDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
    public static func getAttributesForEntity(entity: NSEntityDescription) -> Array<EntityAttributeInfo> {
        var result = Array<EntityAttributeInfo>()
        let attributes = entity.attributesByName
        attributes.forEach { attribute in
            let newInfo = EntityAttributeInfo.init(key: attribute.key, value: attribute.value.attributeValueClassName!)
            result.append(newInfo)
        }
        return result
        
    }
    public static func returnAttributeCluster(readOnlyFields: [String], attributes: inout [EntityAttributeInfo], readOnlyAttributes: inout [EntityAttributeInfo], readWriteAttributes: inout [EntityAttributeInfo] ) -> Void {
        for i in 0..<attributes.count {
            
            for readOnly in readOnlyFields {
                if attributes[i].key == readOnly {
                    attributes[i].readOnly = true
                }
            }
        }
        readOnlyAttributes = attributes.filter { $0.readOnly == true}.sorted {
            return $0.key < $1.key
        }
        readWriteAttributes = attributes.filter { $0.readOnly == false}.sorted {
            return $0.key < $1.key
        }
    }
    public static func convertToStandardDate(dateString: String) -> Date! {
        let format = DateFormatter()
        format.timeZone = .current
        format.dateFormat = "dd-MM-yyyy HH:mm"
        return format.date(from: dateString)
    }
    public static func tryCast(_ val:Any) -> String {
        let valueFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
                return formatter
            }()
        switch val {
        case is String, is NSString:
            return val as! String
        case is Int, is Double:
            return valueFormatter.string(from: val as! NSNumber)!
        default:
            return ""
        }
    }
}
