//
//  DoubleExtension.swift
//  Currencies
//
//  Created by Alexander Karpov on 24.06.16.
//  Copyright © 2016 AKarpov. All rights reserved.
//

import Foundation

extension Double {
    func format() -> String {
        let fraction = self - Double(Int(self))
        if fraction == 0 {
            return "\(Int(self))"
        }
        
        return NSString(format: "%.2f", self) as String
    }
}