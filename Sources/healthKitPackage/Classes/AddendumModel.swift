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
    @Published var items2Scans = [item2Scans]()
    public init() {
        let readOnlyFields: [String] = []
        super.init(readOnlyFields: readOnlyFields)
        attachItems2Scans()
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
    private func attachItems2Scans() {
        let libreViewModel = Libre3Model()
        var attachedScans = [Libre3primanota]()
        self.items.sorted(by: {$1.timestamp ?? Date() < $0.timestamp ?? Date()}).forEach { addendum in
            let children = libreViewModel.items.filter { scan in
                return ( scan.devicetimestamp! > addendum.timestamp! && attachedScans.contains(scan) == false )
            }
            if children.count > 0 {
                var newRelation = item2Scans()
                newRelation.item = addendum
                newRelation.children = children
                items2Scans.append(newRelation)
                attachedScans.append(contentsOf: children)
            }
        }
    }
    public struct item2Scans {
        var item: Addendum?
        var children = [Libre3primanota]()
    }
    
}
