//
//  UserViewModelFactory.swift
//  RandomUser
//
//  Created by barufe on 1/03/24.
//

import Foundation

struct UserVieModelFactory{
    static func create() -> UserListViewModel{
        return UserListViewModel(usersUseCase: createUseCase())
    }
    private static func createUseCase() -> UsersUseCase{
        UsersUseCaseImp(userRepository: createRepository())
    }
    private static func createRepository() -> UserRepository{
        UserRepositoryImp(apiDataSource: createApiDataSource(), cdDataSource: createCDDataSource())
    }
    private static func createApiDataSource() -> ApiUserDataSource{
        ApiUserDataSourceImp(networking: NetworkingImp())
    }
    private static func createCDDataSource() -> CDUserDataSource{
        CDUserDataSourceImp()
    }
}
