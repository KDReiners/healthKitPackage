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
    public var childrenRelations: Array<NSRelationshipDescription> = []
    public var childrenClasses: Array<Model> = []
    public var parentRelation: NSRelationshipDescription?
    private var readOnlyFields: [String] = []
    private var deviceCancellable: AnyCancellable?
    init(readOnlyFields: [String]){
        self.readOnlyFields = readOnlyFields
        BaseServices.returnAttributeCluster(readOnlyFields: readOnlyFields, attributes: &attributes, readOnlyAttributes: &readOnlyAttributes, readWriteAttributes: &readWriteAttributes)
        attachValues()
        let properties = T.entity().propertiesByName
        properties.forEach { property in
            if type(of: property.value) == type(of: NSRelationshipDescription()) {
                switch (property.value as! NSRelationshipDescription).maxCount {
                case 0: childrenRelations.append(property.value as! NSRelationshipDescription)
                case 1: parentRelation = property.value as? NSRelationshipDescription
                default: return
                }
            }
        }
        fillChildrenClasses()
    }
    public static func getAttributes(entity: NSEntityDescription) -> [String]
    {
        return entity.attributesByName.enumerated().map { $0.element.key }
    }
    private func fillChildrenClasses() -> Void {
        childrenRelations.forEach { relation in
            var className = "healthKitPackage." + relation.className + "Model"
            var newClass = NSClassFromString(className)
        }
    }
    private func attachValues (devicePublisher: AnyPublisher<[T], Never> = Storage<T>().items.eraseToAnyPublisher()) {
        deviceCancellable = devicePublisher.sink { items in
            self.items = items
        }
        BaseServices.returnAttributeCluster(readOnlyFields: readOnlyFields, attributes: &attributes, readOnlyAttributes: &readOnlyAttributes, readWriteAttributes: &readWriteAttributes)
    }
    public func deleteAllRecords() -> Void {
        items.forEach { item in
            context.delete(item)
        }
        try? context.save()
    }
    public func insertRecord() -> T {
        let result = NSEntityDescription.insertNewObject(forEntityName: T.entity().name!, into: context) as! T
        try? context.save()
        return result
    }
    public func deleteRecord(record: T) -> Void {
        context.delete(record)
    }
    public func saveChanges() -> Void {
        try? context.save()
    }
}
