//
//  Networking.swift
//  RandomUser
//
//  Created by barufe on 28/02/24.
//

import Combine
import Alamofire
import Foundation

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

