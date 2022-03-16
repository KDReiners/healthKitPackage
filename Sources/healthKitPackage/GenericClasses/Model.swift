//
//  Model.swift
//  healthKitShaman
//
//  Created by Klaus-Dieter Reiners on 19.11.21.
//
import CoreData
import Combine
public class Model<T>: GenericViewModel where T: NSManagedObject {
    public var items: [T] = []
    let context = PersistenceController.shared.container.viewContext
    public var attributes: Array<EntityAttributeInfo> = BaseServices.getAttributesForEntity(entity: T.self.entity())
    public var readOnlyAttributes: Array<EntityAttributeInfo> = []
    public var readWriteAttributes: Array<EntityAttributeInfo> = []
    var readOnlyFields: [String] = []
    private var deviceCancellable: AnyCancellable?
    init(readOnlyFields: [String]){
        self.readOnlyFields = readOnlyFields
        BaseServices.returnAttributeCluster(readOnlyFields: readOnlyFields, attributes: &attributes, readOnlyAttributes: &readOnlyAttributes, readWriteAttributes: &readWriteAttributes)
        attachValues()
    }
    
    func attachValues (devicePublisher: AnyPublisher<[T], Never> = Storage<T>().items.eraseToAnyPublisher()) {
        deviceCancellable = devicePublisher.sink { items in
            self.items = items
        }
        BaseServices.returnAttributeCluster(readOnlyFields: readOnlyFields, attributes: &attributes, readOnlyAttributes: &readOnlyAttributes, readWriteAttributes: &readWriteAttributes)
    }
    internal func deleteAllRecords() -> Void {
        items.forEach { item in
            context.delete(item)
        }
        try? context.save()
    }
    public func insertRecord() -> T {
        return NSEntityDescription.insertNewObject(forEntityName: T.entity().name!, into: context) as! T
    }
}
