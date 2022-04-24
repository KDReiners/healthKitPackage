//
//  File.swift
//  
//
//  Created by Klaus-Dieter Reiners on 21.04.22.
//

import Foundation
import CoreData
public protocol GenericTimeCapsule: ObservableObject {
    associatedtype Slice
    func slicer() -> Void
    var slices: [Slice] { get set }
    var columns: [String] { get }
}
