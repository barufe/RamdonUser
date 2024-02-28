//
//  CDNameDto+CoreDataProperties.swift
//  RandomUser
//
//  Created by barufe on 27/02/24.
//
//

import Foundation
import CoreData


extension CDNameDto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDNameDto> {
        return NSFetchRequest<CDNameDto>(entityName: "CDNameDto")
    }

    @NSManaged public var first: String?
    @NSManaged public var last: String?
    @NSManaged public var title: String?
    @NSManaged public var user: CDUserDto?

}

extension CDNameDto : Identifiable {

}
