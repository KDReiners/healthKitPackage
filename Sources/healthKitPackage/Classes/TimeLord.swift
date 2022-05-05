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
    private static var _mlTree: Tree<String>?
    public static var mlTree: Tree<String> {
        get {
            if _mlTree == nil {
                return Tree<String>(value:"leer")
            }
            return _mlTree!
            
        }
    }
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
    public static func getDistinctQuantityTypes() -> [String] {
        var result = [String]()
        timeSlices.forEach { slice in
            if !result.contains(slice.quantityType) {
                result.append(slice.quantityType)
            }
        }
        return result
    }
    public static func createMlTree() async -> Void {
        _mlTree = await Task {
            var master = Tree(value: "Root", children: [Tree<String>]())
            BaseServices.gatherAllLoggings(resolution: 3600, completion: { (success) -> Void in
                if success {
                    let columns = TimeLord.getDistinctQuantityTypes()
                    TimeLord.returnHistory().forEach { timeCluster in
                        var newTree = Tree(value: "\(timeCluster.key.start)", children: [Tree<String>]())
                        columns.forEach { col in
                            let fittingSlices = timeCluster.value.filter( {$0.quantityType == col })
                            if fittingSlices.count != 0 {
                                var child = Tree(value: col, children: [Tree<String>]())
                                timeCluster.value.filter( {$0.quantityType == col }).forEach { slice in
                                    let sibling = Tree(value: "\(slice.value)", children: [Tree<String>]())
                                    child.children?.append(sibling)
                                }
                                newTree.children?.append(child)
                            }
                        }
                        master.children?.append(newTree)
                    }
                }
            })
            return master
        }.value
    }
}
