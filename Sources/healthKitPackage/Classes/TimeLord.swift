//
//  File.swift
//  
//
//  Created by Klaus-Dieter Reiners on 01.05.22.
//

import Foundation
import SwiftUI
public class TimeLord {
    public static var arraytimeSlices = [Slice]()
    public static var universe = Dictionary<Planet, [Slice]>()
    public static func addToTimeSlices(slices: [Slice]) {
        arraytimeSlices.append(contentsOf: slices)
        arraytimeSlices = Array(Set(arraytimeSlices))
    }
    public static func returnHistory() -> Dictionary<DateInterval,[Slice]> {
        let result = Dictionary(grouping: Set(arraytimeSlices)) { (slice) -> DateInterval in
            return slice.sliceDateInterval
        }
        print("ArrayToTimeSlices Count: \(arraytimeSlices.count)!")
        print("Resulting Dictionary Count: \(result.count)!")
        result.forEach {slices in
            for slice in slices.value  {
                print("SliceLogTime: \(slice.sliceDateInterval.start) QuantityType: \(slice.quantityType) Value: \(slice.value)")
            }
        }
        return result
    }
}
