//
//  ViewController.swift
//  Currencies
//
//  Created by Alexander Karpov on 24.06.16.
//  Copyright © 2016 AKarpov. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let currencies = CurrenciesAPI()
        currencies.getLatestRates("EUR", success: (
            {
                currencyArray in 
                let eur = currencyArray.filter({$0.name == "RUB"})
                if eur.count > 0 { 
                    let eurString = eur[0].rate.format()
                    let ref = FIRDatabase.database().referenceFromURL("https://currencieskarpov.firebaseio.com/rates/EUR")
                    ref.setValue(eurString)
                }
            }
        ), error: nil)
        

        currencies.getLatestRates("USD", success: (
            {
                currencyArray in 
                let usd = currencyArray.filter({$0.name == "RUB"})
                if usd.count > 0 { 
                    if usd.count > 0 { 
                        let usdString = usd[0].rate.format()
                        let ref = FIRDatabase.database().referenceFromURL("https://currencieskarpov.firebaseio.com/rates/USD")
                        ref.setValue(usdString)
                    }
                }
            }
            ), error: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

