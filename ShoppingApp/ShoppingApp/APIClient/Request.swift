//
//  Request.swift
//  ShoppingApp
//
//  Created by Anita Stashevskaya on 27.08.2023.
//

import Foundation

/// Single API call
final class Request {
    // Base url: https://www.avito.st/s/interns-ios/main-page.json
    // Detail url: https://www.avito.st/s/interns-ios/details/{itemId}.json
    
    private struct Constants {
        static let baseURL = "https://www.avito.st/s/interns-ios"
        static let mainPageUrl = "/main-page.json"
        static let detailPageURL = "/details"
        
    }
    private let pathComponent: String
    
    var urlString: String {
        var string = Constants.baseURL
        
        
        if !pathComponent.isEmpty {
            string += "\(Constants.detailPageURL)/\(pathComponent).json"
        } else {
            string += Constants.mainPageUrl
        }
        return string
    }
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public init(pathComponent: String = "") {
        self.pathComponent = pathComponent
    }
}
