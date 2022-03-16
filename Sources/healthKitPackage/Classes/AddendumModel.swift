//
//  File.swift
//  
//
//  Created by Klaus-Dieter Reiners on 16.03.22.
//

import Foundation
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
            result = newValue.sorted(by: { $1.timestamp! > $0.timestamp!})
        }
    }
}
