//
//  UsersUseCase.swift
//  RandomUser
//
//  Created by barufe on 29/02/24.
//

import Foundation

protocol UsersUseCase {
    func execute(completion: @escaping (Result<ResponseEntity, Error>) -> Void)
}

final class UsersUseCaseImp: UsersUseCase {
    private let userRepository: UserRepository
    private var response: ResponseEntity?
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func execute(completion: @escaping (Result<ResponseEntity, Error>) -> Void){
        userRepository.fetchUsers {result in
            completion(result)
        }
    }
}
enum ErrorDomain: Error {
    case urlIsEmpty
    case callFailure
}
