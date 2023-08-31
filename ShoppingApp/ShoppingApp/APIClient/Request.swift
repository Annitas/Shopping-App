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
    
    public let httpMethod = "GET"
    
    public init(pathComponent: String = "") {
        self.pathComponent = pathComponent
    }
//    
//    convenience init?(url: URL) {
//        let string = url.absoluteString
//        if !string.contains(Constants.baseURL) {
//            return nil
//        }
//    }
    
    
//    convenience init?(url: URL) {
//            let string = url.absoluteString
//            if !string.contains(Constants.baseUrl) {
//                return nil
//            }
//            let trimmed = string.replacingOccurrences(of: Constants.baseUrl+"/", with: "")
//            if trimmed.contains("/") {
//                let components = trimmed.components(separatedBy: "/")
//                if !components.isEmpty {
//                    let endpointString = components[0] // Endpoint
//                    var pathComponents: [String] = []
//                    if components.count > 1 {
//                        pathComponents = components
//                        pathComponents.removeFirst()
//                    }
//                    if let rmEndpoint = RMEndpoint(
//                        rawValue: endpointString
//                    ) {
//                        self.init(endpoint: rmEndpoint, pathComponents: pathComponents)
//                        return
//                    }
//                }
//            } else if trimmed.contains("?") {
//                let components = trimmed.components(separatedBy: "?")
//                if !components.isEmpty, components.count >= 2 {
//                    let endpointString = components[0]
//                    let queryItemsString = components[1]
//                    // value=name&value=name
//                    let queryItems: [URLQueryItem] = queryItemsString.components(separatedBy: "&").compactMap({
//                        guard $0.contains("=") else {
//                            return nil
//                        }
//                        let parts = $0.components(separatedBy: "=")
//
//                        return URLQueryItem(
//                            name: parts[0],
//                            value: parts[1]
//                        )
//                    })
//
//                    if let rmEndpoint = RMEndpoint(rawValue: endpointString) {
//                        self.init(endpoint: rmEndpoint, queryParameters: queryItems)
//                        return
//                    }
//                }
//            }
//
//            return nil
//        }
}

extension Request {
    static let listProductRequest = Request()
    
}
