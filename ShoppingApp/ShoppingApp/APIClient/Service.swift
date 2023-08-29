//
//  Service.swift
//  ShoppingApp
//
//  Singleton
//

import Foundation

/// API service to get Products data
final class Service {
    static let shared = Service()
    
    private init() {}
    
    enum ServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    public func execute<T: Codable>(_ request: Request,
                                    expecting type: T.Type,
                                    completion: @escaping (Result<T, Error>) -> Void) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(ServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil  else {
                completion(.failure(error ?? ServiceError.failedToGetData))
                return
            }
            
            // Decode response
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    private func request(from productRequest: Request) -> URLRequest? {
        guard let url = productRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = productRequest.httpMethod // GET
        return request
    }
}
