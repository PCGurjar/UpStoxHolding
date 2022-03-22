//
//  HoldingModel.swift
//  HoldingList
//
//  Created by Poonamchand Raykhere on 19/03/22.
//

import Foundation

// MARK: - HoldingData
struct HoldingData: Codable {
    let clientID: String
    let holdingList: [Holding]
    let responseType: String
    let timestamp: Int

    enum CodingKeys: String, CodingKey {
        case clientID = "client_id"
        case holdingList = "data"
        case responseType = "response_type"
        case timestamp
    }
}

// MARK: - Holding
struct Holding: Codable {
    let avgPrice: String
    let cncUsedQuantity, collateralQty: Int
    let collateralType: String
    let collateralUpdateQty: Int
    let companyName: String
    let haircut: Double
    let holdingsUpdateQty: Int
    let isin, product: String
    let quantity: Int
    let symbol: String
    let t1HoldingQty: Int
    let tokenBse, tokenNse: String
    let withheldCollateralQty, withheldHoldingQty: Int
    let ltp, close: Double

    enum CodingKeys: String, CodingKey {
        case avgPrice = "avg_price"
        case cncUsedQuantity = "cnc_used_quantity"
        case collateralQty = "collateral_qty"
        case collateralType = "collateral_type"
        case collateralUpdateQty = "collateral_update_qty"
        case companyName = "company_name"
        case haircut
        case holdingsUpdateQty = "holdings_update_qty"
        case isin, product, quantity, symbol
        case t1HoldingQty = "t1_holding_qty"
        case tokenBse = "token_bse"
        case tokenNse = "token_nse"
        case withheldCollateralQty = "withheld_collateral_qty"
        case withheldHoldingQty = "withheld_holding_qty"
        case ltp, close
    }
    
    func getPLValue()-> Double {
        let cv = getCurrentValue()
        let iV = getInvestmentValue()
        return cv - iV
    }
    
    func getCurrentValue()-> Double {
        let cv = self.ltp * Double(self.quantity)
        return cv
    }
    
    func getInvestmentValue()-> Double {
        let iV = Double(self.avgPrice)! - Double(self.quantity)
        return iV
    }
}


struct TotalHoldingModel {
    var currentValue: Double = 0
    var totalInvestment: Double = 0
    var todayslPL: Double = 0
    var TotalPL: Double = 0
}

