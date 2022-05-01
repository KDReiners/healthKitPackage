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
    }
    public static func returnHistory() -> Dictionary<DateInterval,[Slice]> {
        let result = Dictionary(grouping: Set(arraytimeSlices)) { (slice) -> DateInterval in
            return slice.sliceDateInterval
        }
        print("Done")
        return result
    }
}
