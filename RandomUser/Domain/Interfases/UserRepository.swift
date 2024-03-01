//
//  UserRepository.swift
//  RandomUser
//
//  Created by barufe on 29/02/24.
//

import Foundation

protocol UserRepository {
    func fetchUsers(completion: @escaping (Result<ResponseEntity, Error>) -> Void)
}
