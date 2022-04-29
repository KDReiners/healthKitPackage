//
//  File.swift
//  
//
//  Created by Klaus-Dieter Reiners on 21.04.22.
//

import Foundation
import CoreData
public protocol GenericTimeCapsule: ObservableObject {
    associatedtype T
    var slices: Array<T>{ get set }
    init(resolution: Double, quantityType: String)
    func slicer() -> Void
    var columns: [String] { get }
}
