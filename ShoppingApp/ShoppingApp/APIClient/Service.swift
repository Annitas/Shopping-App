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
    
    public func execute(_ request: Request, completion: @escaping (Result<String, Error>) -> Void) {
        
    }
}
