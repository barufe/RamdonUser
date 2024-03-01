//
//  CDLocationDto+CoreDataProperties.swift
//  RandomUser
//
//  Created by barufe on 29/02/24.
//
//

import Foundation
import CoreData


extension CDLocationDto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDLocationDto> {
        return NSFetchRequest<CDLocationDto>(entityName: "CDLocationDto")
    }

    @NSManaged public var city: String?
    @NSManaged public var country: String?
    @NSManaged public var postcode: String?
    @NSManaged public var state: String?
    @NSManaged public var coordinates: CDCoordinatesDto?
    @NSManaged public var street: CDStreetDto?
    @NSManaged public var timezone: CDTimeDto?

}

extension CDLocationDto : Identifiable {

}
