//
//  TodayViewController.swift
//  CurrenciesToday
//
//  Created by Alexander Karpov on 24.06.16.
//  Copyright © 2016 AKarpov. All rights reserved.
//

import UIKit
import NotificationCenter
import Firebase

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var eurLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        FIRApp.configure()

        // Do any additional setup after loading the view from its nib.
        
//        let currencies = CurrenciesAPI()
//        currencies.get
        
        let currencies = CurrenciesAPI()
        currencies.getLatestRates("EUR", success: (
            {
                [weak self]
                currencyArray in 
                let eur = currencyArray.filter({$0.name == "RUB"})
                if eur.count > 0 { 
                    let eurString = eur[0].rate.format()
                    let ref = FIRDatabase.database().referenceFromURL("https://currencieskarpov.firebaseio.com/rates/EUR")
                    ref.setValue(eurString)
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        self?.eurLabel.text = eurString 
                    })
                }
            }
            ), error: nil)
        
        currencies.getLatestRates("USD", success: (
            {
                [weak self]
                currencyArray in 
                let usd = currencyArray.filter({$0.name == "RUB"})
                if usd.count > 0 { 
                    let usdString = usd[0].rate.format()
                    let ref = FIRDatabase.database().referenceFromURL("https://currencieskarpov.firebaseio.com/rates/USD")
                    ref.setValue(usdString)
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        self?.usdLabel.text = usdString 
                    })
                }
            }
            ), error: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
}
