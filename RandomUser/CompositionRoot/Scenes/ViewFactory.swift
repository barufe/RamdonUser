//
//  UserListFactory.swift
//  RandomUser
//
//  Created by barufe on 29/02/24.
//

import Foundation

struct ViewFactory {
    static func createUserList() -> ListViewController{
        return ListViewController(viewModel: UserVieModelFactory.create())
    }
    
    static func createSplash() -> SplashViewController{
        return SplashViewController(viewModel: UserVieModelFactory.create())
    }
}



