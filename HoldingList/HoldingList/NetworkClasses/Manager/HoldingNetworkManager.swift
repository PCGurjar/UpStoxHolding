//
//  HoldingNetworkManager.swift
//  HoldingList
//
//  Created by Poonamchand Raykhere on 22/03/22.
//

import Foundation



struct HoldingNetworkManager {
    
    private let router = Router<HoldingEndPoint>()
    private var holdingEndPoint: HoldingEndPoint?
    public typealias HoldingRouterCompletion = (_ holdingData: HoldingData?,_ error: Error?)->()

    
    init (endPoint : HoldingEndPoint) {
        self.holdingEndPoint = endPoint
    }
    
    func getHoldingList(completion: @escaping HoldingRouterCompletion) {
        router.request(self.holdingEndPoint!) { data, response, error in
            if let d = data {
                let holdingData = try? JSONDecoder().decode(HoldingData.self, from: d)
                completion(holdingData, nil)
                
            } else if let e = error {
                completion(nil, e)
                
            } else {
                completion(nil, NetworkError.nodata)
            }
        }
    }
    
}

struct HoldingEndPoint: EndPointType {
    
    var path = Constants.APIConstants.myHoldingURL
    var httpMethod: HTTPMethod = .get
    var task: HTTPTask = HTTPTask.request
    var headers: HTTPHeaders? = nil
}
