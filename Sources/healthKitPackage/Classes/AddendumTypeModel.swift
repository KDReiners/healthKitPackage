//
//  File.swift
//
//
//  Created by Klaus-Dieter Reiners on 16.03.22.
//

import Foundation
public class AddendumTypeModel: Model<Addendumtype> {
    @Published var result: [Addendumtype]!
    public init() {
        let readOnlyFields: [String] = []
        super.init(readOnlyFields: readOnlyFields)
    }
    override public var items: [Addendumtype] {
        get {
            return result
        }
        set
        {
            result = newValue.sorted(by: { $1.name! > $0.name!})
        }
    }
}
