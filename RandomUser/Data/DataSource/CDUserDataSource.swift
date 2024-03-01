//
//  CDUserDataSource.swift
//  RandomUser
//
//  Created by barufe on 28/02/24.
//

import Foundation
import CoreData

protocol CDUserDataSource{
    func fetchUsers(completion: @escaping (Result<CDResponseDto, Error>) -> Void)
    func saveUsersToCoreData(response: ResponseDto)
    func deleteAllUsers()
}

class CDUserDataSourceImp: CDUserDataSource {
    let coreDataManager = ManagerCoreDataImp()
    let context = ManagerCoreDataImp.shared.context
    
    func fetchUsers(completion: @escaping (Result<CDResponseDto, Error>) -> Void) {
        let fetchRequest = CDRequest.response
        
        do {
            let result = try context.fetch(fetchRequest)
            if let response = result.first {
                completion(.success(response))
            } else {
                completion(.failure(CDError.generic))
            }
        } catch {
            completion(.failure(error))
        }
    }
    func saveUsersToCoreData(response: ResponseDto) {
        let response = MapResponseDtoToCDResponseDto.mapper(response, context: context)
       try? context.save()
    }
    
    func deleteAllUsers() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "CDResponseDto")
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(batchDeleteRequest)
            coreDataManager.saveContext()
        } catch {
            print("Error deleting users: \(error)")
        }
    }
}
enum CDError: Error {
    case generic
    case parsing
}
