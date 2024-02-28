//
//  CDNationalityDto+CoreDataProperties.swift
//  RandomUser
//
//  Created by barufe on 27/02/24.
//
//

import Foundation
import CoreData


extension CDNationalityDto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDNationalityDto> {
        return NSFetchRequest<CDNationalityDto>(entityName: "CDNationalityDto")
    }

    @NSManaged public var nat: String?
    @NSManaged public var user: CDUserDto?

}

extension CDNationalityDto : Identifiable {

}
