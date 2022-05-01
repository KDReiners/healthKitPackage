//
//  File.swift
//  
//
//  Created by Klaus-Dieter Reiners on 01.05.22.
//

import Foundation
public class TimeLord {
    public static var timeSlices = [Slice]()
    public static var universe = Dictionary<Planet, [Slice]>()
    public static func addToTimeSlices(slices: [Slice]) {
        timeSlices.append(contentsOf: slices)
    }
    public static func returnHistory() -> Dictionary<DateInterval,[Slice]> {
        let result = Dictionary(grouping: timeSlices) { (slice) -> DateInterval in
            return slice.sliceDateInterval
        }
        print("Done")
        return result
    }
}
