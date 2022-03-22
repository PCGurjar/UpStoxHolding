//
//  Service.swift
//  HoldingList
//
//  Created by Poonamchand Raykhere on 22/03/22.
//

import Foundation


public enum HTTPMethod: String {
    
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

public typealias HTTPHeaders = [String:String]

public enum HTTPTask {
    
    case request
    case requestParameters(bodyParameters: Parameters?, urlParameters: Parameters)
    case requestParametersAndHeaders(bodyParameters: Parameters?, urlParameters: Parameters, additionHeader: HTTPHeaders?)
}
