//
//  NetworkRouter.swift
//  HoldingList
//
//  Created by Poonamchand Raykhere on 22/03/22.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()


protocol NetworkRouter: AnyObject {
    associatedtype EndPoint: EndPointType
    
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}
