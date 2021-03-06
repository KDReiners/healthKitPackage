//
//  SourceView.swift
//  healthKitShaman
//
//  Created by Klaus-Dieter Reiners on 19.11.21.
//

import Foundation
public class SourceModel: Model<Source> {
    @Published var result: [Source]!
    public init() {
        let readOnlyFields = [  "hk_bundleIdentifier", "hk_name", "hk_operatingSystemVersion"
                                , "hk_productType", "hk_version", "uuid"]
        super.init(readOnlyFields: readOnlyFields)
    }
    override public var items: [Source] {
        get {
            return result
        }
        set
        {
            result = newValue.sorted(by: { $1.uuid!.uuidString > $0.uuid!.uuidString })
        }
    }
}

