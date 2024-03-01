//
//  CDInfoDto+CoreDataProperties.swift
//  RandomUser
//
//  Created by barufe on 29/02/24.
//
//

import Foundation
import CoreData


extension CDInfoDto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDInfoDto> {
        return NSFetchRequest<CDInfoDto>(entityName: "CDInfoDto")
    }

    @NSManaged public var page: Int16
    @NSManaged public var results: Int16
    @NSManaged public var seed: String?
    @NSManaged public var version: String?

}

extension CDInfoDto : Identifiable {

}
