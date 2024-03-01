//
//  ApiUserDataSource.swift
//  RandomUser
//
//  Created by barufe on 28/02/24.
//

import Foundation

import Alamofire

protocol ApiUserDataSource{
    func fetchUsers(completion: @escaping (Result<ResponseDto, Error>) -> Void)
}

class ApiUserDataSourceImp: ApiUserDataSource{
    var networking: Networking
    private let path : String = "?results=5000"
    
    init(networking: Networking) {
        self.networking = networking
    }
    func fetchUsers(completion: @escaping (Result<ResponseDto, Error>) -> Void){
        
        networking.request(urlBase: "\(EnviromentParameters().url + path)", method: .get, parameter: nil, encoding: URLEncoding.default) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let responseDto = try decoder.decode(ResponseDto.self, from: data)
                    completion(.success(responseDto))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
