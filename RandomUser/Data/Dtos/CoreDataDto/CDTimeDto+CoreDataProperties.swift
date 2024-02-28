//
//  CDTimeDto+CoreDataProperties.swift
//  RandomUser
//
//  Created by barufe on 28/02/24.
//
//

import Foundation
import CoreData


extension CDTimeDto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDTimeDto> {
        return NSFetchRequest<CDTimeDto>(entityName: "CDTimeDto")
    }

    @NSManaged public var offset: String?
    @NSManaged public var descriptions: String?
    @NSManaged public var location: CDLocationDto?

}

extension CDTimeDto : Identifiable {

}
