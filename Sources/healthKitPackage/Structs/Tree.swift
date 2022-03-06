//
//  Tree.swift
//  healthKitCoreData
//
//  Created by Klaus-Dieter Reiners on 27.02.22.
//

import Foundation
public struct Tree<Value: Hashable> {
    public let value: Value
    public var children: [Tree]? = nil
}
