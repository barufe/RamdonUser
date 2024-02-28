//
//  CDLocationDto+CoreDataProperties.swift
//  RandomUser
//
//  Created by barufe on 27/02/24.
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
    @NSManaged public var street: CDStreetDto?
    @NSManaged public var user: CDUserDto?
    @NSManaged public var coordinate: CDCoordinatesDto?
    @NSManaged public var time: CDTimeDto?
    
}

extension CDLocationDto : Identifiable {

}
