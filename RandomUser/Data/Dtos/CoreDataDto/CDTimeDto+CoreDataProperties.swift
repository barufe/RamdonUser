//
//  CDTimeDto+CoreDataProperties.swift
//  RandomUser
//
//  Created by barufe on 29/02/24.
//
//

import Foundation
import CoreData


extension CDTimeDto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDTimeDto> {
        return NSFetchRequest<CDTimeDto>(entityName: "CDTimeDto")
    }

    @NSManaged public var descriptions: String?
    @NSManaged public var offset: String?

}

extension CDTimeDto : Identifiable {

}
