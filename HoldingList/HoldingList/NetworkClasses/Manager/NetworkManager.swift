//
//  NetworkManager.swift
//  HoldingList
//
//  Created by Poonamchand Raykhere on 22/03/22.
//

import Foundation

enum NetworkAPI {
    case getHoldingList
}

enum NetworkResponse: String {
    case success
    case badrequest = "Bad request"
    case failed = "Network request failed"
    case nodata = "Response return with no data"
    case unableToDecode = "We could not decode the response"
}


enum Result <String> {
    case success
    case failure(String)
}

fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result <String> {
    switch response.statusCode {
    case 200...299: return .success
    case 501...599: return .failure(NetworkResponse.badrequest.rawValue)
    default: return .failure(NetworkResponse.failed.rawValue)
    }
}
