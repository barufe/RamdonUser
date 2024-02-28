//
//  CDCoordinatesDto+CoreDataProperties.swift
//  RandomUser
//
//  Created by barufe on 28/02/24.
//
//

import Foundation
import CoreData


extension CDCoordinatesDto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCoordinatesDto> {
        return NSFetchRequest<CDCoordinatesDto>(entityName: "CDCoordinatesDto")
    }

    @NSManaged public var latitude: String?
    @NSManaged public var longitude: String?
    @NSManaged public var location: CDLocationDto?

}

extension CDCoordinatesDto : Identifiable {

}
