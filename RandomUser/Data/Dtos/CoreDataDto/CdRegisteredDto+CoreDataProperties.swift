//
//  CdRegisteredDto+CoreDataProperties.swift
//  RandomUser
//
//  Created by barufe on 29/02/24.
//
//

import Foundation
import CoreData


extension CdRegisteredDto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CdRegisteredDto> {
        return NSFetchRequest<CdRegisteredDto>(entityName: "CdRegisteredDto")
    }

    @NSManaged public var age: Int16
    @NSManaged public var date: String?

}

extension CdRegisteredDto : Identifiable {

}
