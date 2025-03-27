import Foundation
import CoreData

@objc(Car)
public class Car: NSManagedObject, Identifiable {
  @NSManaged public var id: UUID
  @NSManaged public var brand: String
  @NSManaged public var model: String
  @NSManaged public var year: Int16
  @NSManaged public var mileage: Double
  @NSManaged public var fuelType: String
  @NSManaged public var plateNumber: String
  @NSManaged public var maintenances: NSSet?
  @NSManaged public var fuelRecords: NSSet?
  
  public override func awakeFromInsert() {
    super.awakeFromInsert()
    id = UUID()
  }
}

// MARK: - Enums
extension Car {
  enum FuelType: String, CaseIterable {
    case gasoline = "Benzin"
    case diesel = "Dizel"
    case lpg = "LPG"
    case electric = "Elektrik"
    case hybrid = "Hibrit"
  }
}

// MARK: - Generated accessors for maintenances
extension Car {
  @objc(addMaintenancesObject:)
  @NSManaged public func addToMaintenances(_ value: Maintenance)
  
  @objc(removeMaintenancesObject:)
  @NSManaged public func removeFromMaintenances(_ value: Maintenance)
  
  @objc(addMaintenances:)
  @NSManaged public func addToMaintenances(_ values: NSSet)
  
  @objc(removeMaintenances:)
  @NSManaged public func removeFromMaintenances(_ values: NSSet)
}

// MARK: - Generated accessors for fuelRecords
extension Car {
  @objc(addFuelRecordsObject:)
  @NSManaged public func addToFuelRecords(_ value: FuelRecord)
  
  @objc(removeFuelRecordsObject:)
  @NSManaged public func removeFromFuelRecords(_ value: FuelRecord)
  
  @objc(addFuelRecords:)
  @NSManaged public func addToFuelRecords(_ values: NSSet)
  
  @objc(removeFuelRecords:)
  @NSManaged public func removeFromFuelRecords(_ values: NSSet)
}