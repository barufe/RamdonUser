//
//  UserListViewModel.swift
//  RandomUser
//
//  Created by barufe on 29/02/24.
//

import Foundation

class UserListViewModel {
    private let usersUseCase: UsersUseCase
    private var allUsers = [UserEntity]()
    private var filteredUsers = [UserEntity]()
    
    init(usersUseCase: UsersUseCase) {
        self.usersUseCase = usersUseCase
    }
    
    func getUsers(completion: @escaping (Result<ResponseEntity, Error>) -> Void) {
        Task {
            do {
                usersUseCase.execute { result in
                    switch result {
                    case .success(let response):
                        self.allUsers += response.results
                        self.filteredUsers = self.allUsers
                        completion(.success(response))
                    case .failure(let error):
                        completion(.failure(error))
                        print("Error: \(error)")
                    }
                }
            }
        }
    }
    func filterUsers(with searchText: String) {
        if searchText.isEmpty {
            filteredUsers = allUsers
        } else {
            filteredUsers = allUsers.filter { user in
                return user.name.first.lowercased().contains(searchText.lowercased()) ||
                user.name.last.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    func user(at index: Int) -> UserEntity {
        return filteredUsers[index]
    }
    
    func numberOfUsers() -> Int {
        return filteredUsers.count
    }
}

