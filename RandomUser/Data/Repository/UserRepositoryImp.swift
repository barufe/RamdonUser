//
//  UserRepositoryImp.swift
//  RandomUser
//
//  Created by barufe on 29/02/24.
//

import Foundation

class UserRepositoryImp: UserRepository {
    private let apiDataSource: ApiUserDataSource
    private let cdDataSource: CDUserDataSource
    let networkManager = NetworkManager.shared
    
    init(apiDataSource: ApiUserDataSource, cdDataSource: CDUserDataSource) {
        self.apiDataSource = apiDataSource
        self.cdDataSource = cdDataSource
    }
    
    func fetchUsers(completion: @escaping (Result<ResponseEntity, Error>) -> Void) {
        if networkManager.isConnected {
            self.apiDataSource.fetchUsers { result in
                switch result {
                case .success(let responseDto):
                    print("LA DATA VIENE DE LA API")
                    let responseEntity = UserEntityMapper.mapDto(dto: responseDto)
                    self.cdDataSource.saveUsersToCoreData(response: responseDto)
                    completion(.success(responseEntity))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } else {
            self.cdDataSource.fetchUsers { [weak self] result in
                switch result {
                case .success(let cdResponseDto):
                    do {
                        print("LA DATA VIENE DE CD")
                        let convertInDto = try ResponseDto(cdObject: cdResponseDto)
                        let userEntity = UserEntityMapper.mapDto(dto: convertInDto)
                        completion(.success(userEntity))
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                    print("Error fetching users from CoreData: \(error)")
                }
            }
        }
    }
}
