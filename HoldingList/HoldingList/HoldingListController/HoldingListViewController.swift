//
//  HoldingListViewController.swift
//  HoldingList
//
//  Created by Poonamchand Raykhere on 19/03/22.
//

import UIKit

class HoldingListViewController: UIViewController {
    
    @IBOutlet weak var tableHoldingList: UITableView!
    @IBOutlet weak var labelCurrent: UILabel!
    @IBOutlet weak var labelInvested: UILabel!
    @IBOutlet weak var labelTodaysPNL: UILabel!
    @IBOutlet weak var labelTotalPNL: UILabel!
    

    var holdingVm: HoldingViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view

        tableHoldingList.delegate = self
        tableHoldingList.dataSource = self
        
        // create view model 
        holdingVm = HoldingViewModel(networkManager: HoldingNetworkManager(endPoint: HoldingEndPoint()))
        
        holdingVm?.callMyHoldingAPI(completion: { error in
            if error == nil {
                DispatchQueue.main.async {
                    self.tableHoldingList.reloadData()
                    self.setTotalPNLData()
                }
            } else {
                print(error?.localizedDescription ?? "Error")
            }
        })
    }
    
    func setTotalPNLData() {
        labelCurrent.text = String(format: "₹%.2f", holdingVm!.totalHoldingModel.currentValue)
        labelInvested.text = String(format: "₹%.2f", holdingVm!.totalHoldingModel.totalInvestment)
        labelTodaysPNL.text = String(format: "₹%.2f", holdingVm!.totalHoldingModel.todayslPL)
        labelTotalPNL.text = String(format: "₹%.2f", holdingVm!.totalHoldingModel.TotalPL)
    }
    
}


// MARK:- Table view methods

extension HoldingListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return holdingVm?.arrHolding.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HoldingTableViewCell", for: indexPath) as? HoldingTableViewCell else{
            return UITableViewCell()
        }
        cell.modelHolding = holdingVm?.arrHolding[indexPath.row]
        return cell
    }
    
}
