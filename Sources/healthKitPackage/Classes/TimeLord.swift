//
//  File.swift
//  
//
//  Created by Klaus-Dieter Reiners on 01.05.22.
//

import Foundation
public class TimeLord {
    public static var universe = Dictionary<Planet, [Slice]>()
    public static func addToUniverse(planet: Planet, slices: [Slice]) {
        universe[planet] = slices
    }
    
}
