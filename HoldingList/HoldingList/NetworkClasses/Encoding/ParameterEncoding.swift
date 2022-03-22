//
//  ParameterEncoding.swift
//  HoldingList
//
//  Created by Poonamchand Raykhere on 22/03/22.
//

import Foundation

public typealias Parameters = [String:Any]


public protocol ParameterEncoder {
    
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}


public enum NetworkError: String, Error {
    
    case parameterNil = "Parameters were nil"
    case encodingFail = "Parameters encoding failed"
    case missingURL = "URL is nil"
    case nodata = "Response return with no data"
}

