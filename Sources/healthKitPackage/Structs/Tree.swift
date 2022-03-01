//
//  Tree.swift
//  healthKitCoreData
//
//  Created by Klaus-Dieter Reiners on 27.02.22.
//

import Foundation
struct Tree<Value: Hashable> {
    let value: Value
    var children: [Tree]? = nil
}
