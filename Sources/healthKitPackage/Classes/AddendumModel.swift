//
//  File.swift
//  
//
//  Created by Klaus-Dieter Reiners on 16.03.22.
//

import Foundation
import SwiftUI
public class AddendumModel: Model<Addendum> {
    @Published var result: [Addendum]!
    public init() {
        let readOnlyFields: [String] = []
        super.init(readOnlyFields: readOnlyFields)
    }
    override public var items: [Addendum] {
        get {
            return result
        }
        set
        {
            result = newValue.sorted(by: { $1.timestamp ?? Date() > $0.timestamp ?? Date()})
        }
    }
    public func getAttachedLibreLogs() {
        let libreViewModel = Libre3Model()
        var attachedScans = [Libre3primanota]()
        self.items.sorted(by: {$1.timestamp ?? Date() > $0.timestamp ?? Date()}).forEach { addendum in
            var newTree = Tree(value: addendum, children: [Tree<Addendum>]())
            let children = libreViewModel.items.filter { scan in
                return ( scan.devicetimestamp! > addendum.timestamp! && attachedScans.contains(scan) == false )
            }
            attachedScans.append(contentsOf: children)
        }
    }
}
