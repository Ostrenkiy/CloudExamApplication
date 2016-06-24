//
//  CurrenciesAPI.swift
//  Currencies
//
//  Created by Alexander Karpov on 24.06.16.
//  Copyright © 2016 AKarpov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CurrenciesAPI {
    let apiEndpoint = "http://api.fixer.io/latest"
    
    func getLatestRates(base: String, success: ([Currency] -> Void)?, error errorHandler: (String -> Void)?) {
        let params = [
            "base" : base
        ]
        
        
        Alamofire.request(.GET, apiEndpoint, parameters: params, encoding: .URL, headers: nil).responseSwiftyJSON({
            _, _, json, error in
            
            if let err  = error as? NSError {
                errorHandler?(err.localizedDescription)
                return
            }
            
            if let jsonDict = json["rates"].dictionary {
                var currencies = [Currency]()
                for (name, rate) in jsonDict {
                    currencies += [Currency(base: base, name: name, rate: rate.doubleValue)]
                }
                success?(currencies)
                return
            }
            
            success?([Currency]())
            return
        })
        
    }
}

struct Currency {
    var name: String
    var base: String
    var rate: Double
    
    init(base: String, name: String, rate: Double) {
        self.base = base
        self.name = name
        self.rate = rate
    }
}