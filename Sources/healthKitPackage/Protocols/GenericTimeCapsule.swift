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
    var slices: [T] { get set }
    func slicer() -> Void
}
