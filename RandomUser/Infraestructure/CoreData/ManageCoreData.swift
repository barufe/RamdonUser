//
//  ManageCoreData.swift
//  RandomUser
//
//  Created by barufe on 27/02/24.
//

import CoreData

enum CDRequest {
    static let user = CDUserDto.fetchRequest()
    static let registered = CdRegisteredDto.fetchRequest()
    static let picture = CDPictureDto.fetchRequest()
    static let nationality = CDNationalityDto.fetchRequest()
    static let name = CDNameDto.fetchRequest()
    static let login = CDLoginDto.fetchRequest()
    static let location = CDLocationDto.fetchRequest()
    static let id = CDIdDto.fetchRequest()
    static let dob = CDDobDto.fetchRequest()
}

class ManagerCoreDataImp {
    static let shared = ManagerCoreDataImp()
    //private init () {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "RandomUser")
        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    
    func saveContext() {
        if context.hasChanges {
            do{
                try context.save()
            }catch{
                let nserror = error as NSError
                fatalError("Unresolved error \(error), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchUser() -> [CDUserDto]{
        var user = [CDUserDto]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: CDUserDto.description())
        do{
            user = try context.fetch(fetchRequest) as! [CDUserDto]
        }
        catch{
            print("fetching error")
        }
        return user
    }
}
