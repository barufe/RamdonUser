//
//  CDIdDto+CoreDataProperties.swift
//  RandomUser
//
//  Created by barufe on 29/02/24.
//
//

import Foundation
import CoreData


extension CDIdDto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDIdDto> {
        return NSFetchRequest<CDIdDto>(entityName: "CDIdDto")
    }

    @NSManaged public var idName: String?
    @NSManaged public var idValue: String?

}

extension CDIdDto : Identifiable {

}
