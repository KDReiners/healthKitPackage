//
//  File.swift
//  
//
//  Created by Klaus-Dieter Reiners on 01.05.22.
//

import Foundation
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
        return result
    }
}
