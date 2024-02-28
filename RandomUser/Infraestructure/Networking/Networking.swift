//
//  Networking.swift
//  RandomUser
//
//  Created by barufe on 28/02/24.
//

import Combine
import Alamofire
import Foundation

protocol UserDataSource{
    func fetchUsers(completion: @escaping (Result<ResponseDto, Error>) -> Void)
}

class UserDataSourceImp: UserDataSource {
    
    private let urlBase: String = "https://randomuser.me/api/?results=10"
    var networking: Networking
    
    init(networking: Networking) {
        self.networking = networking
    }
    
    func fetchUsers(completion: @escaping (Result<ResponseDto, Error>) -> Void) {
        networking.request(urlBase: urlBase, method: .get, parameter: nil, encoding: URLEncoding.default) { result in
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

protocol Networking{
    func request(urlBase:URLConvertible, method: HTTPMethod, parameter: Parameters?, encoding: ParameterEncoding, completion: @escaping (Result<Data, Error>) -> Void)
}

class NetworkingImp: Networking {
    func request(urlBase: URLConvertible, method: HTTPMethod, parameter: Parameters?, encoding: ParameterEncoding, completion: @escaping (Result<Data, Error>) -> Void) {
        
        AF.request(urlBase, method: method, parameters: parameter, encoding: encoding).responseData { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
