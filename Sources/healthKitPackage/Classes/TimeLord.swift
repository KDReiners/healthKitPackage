//
//  File.swift
//  
//
//  Created by Klaus-Dieter Reiners on 01.05.22.
//

import Foundation
import SwiftUI
public class TimeLord {
    public static var timeSlices = [Slice]()
    public static func addToTimeSlices(slices: [Slice]) {
        timeSlices.append(contentsOf: slices)
        timeSlices = Array(Set(timeSlices))
    }
    public static func returnHistory() -> Dictionary<DateInterval,[Slice]> {
        let result = Dictionary(grouping: Set(timeSlices)) { (slice) -> DateInterval in
            return slice.sliceDateInterval
        }
        print("ArrayToTimeSlices Count: \(timeSlices.count)!")
        print("Resulting Dictionary Count: \(result.count)!")
        result.forEach {slices in
            for slice in slices.value  {
                print("SliceLogTime: \(slice.sliceDateInterval.start) QuantityType: \(slice.quantityType) Value: \(slice.value)")
            }
        }
        return result
    }
}
