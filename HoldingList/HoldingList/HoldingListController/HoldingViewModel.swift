//
//  HoldingViewModel.swift
//  HoldingList
//
//  Created by Poonamchand Raykhere on 19/03/22.
//

import UIKit

class HoldingViewModel {
    
    var holdingNetworkManager: HoldingNetworkManager?
    public typealias Completion = (_ error: Error?)->()
    var arrHolding = [Holding]()
    var totalHoldingModel = TotalHoldingModel()
    
    
    init (networkManager: HoldingNetworkManager) {
        self.holdingNetworkManager = networkManager
    }

    func callMyHoldingAPI(completion: @escaping Completion) {
        holdingNetworkManager?.getHoldingList(completion: { holdingData, error in
            guard error != nil else {
                self.arrHolding = holdingData?.holdingList ?? []
                self.calculateTotalHolding(arrHolding: self.arrHolding)
                
                completion(nil)
                return
            }
            completion(error)
        })
    }
    
    private func calculateTotalHolding(arrHolding: [Holding]) {
        totalHoldingModel = TotalHoldingModel()
        
        for holding in arrHolding {
            totalHoldingModel.currentValue += holding.getCurrentValue()
            totalHoldingModel.totalInvestment += holding.getInvestmentValue()
            totalHoldingModel.todayslPL += ((holding.close - holding.ltp) * Double(holding.quantity))
        }
        totalHoldingModel.TotalPL = totalHoldingModel.currentValue - totalHoldingModel.totalInvestment
    }
}
