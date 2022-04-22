//
//  File.swift
//  
//
//  Created by Klaus-Dieter Reiners on 09.04.22.
//

import Foundation
import Foundation
public class Libre3Model: Model<Libre3primanota> {
    @Published var result: [Libre3primanota]!
    public init() {
        let readOnlyFields: [String] = []
        super.init(readOnlyFields: readOnlyFields)
    }
    override public var items: [Libre3primanota] {
        get {
            return result
        }
        set
        {
            result = newValue.sorted(by: { $1.devicetimestamp ?? Date() < $0.devicetimestamp ?? Date()}).filter { posting in
                return posting.device?.contains("Link") == false
            }
        }
    }
}
