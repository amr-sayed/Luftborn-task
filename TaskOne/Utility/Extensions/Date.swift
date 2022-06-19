//
//  Date.swift
//  LM
//
//  Created by George Naiem on 4/3/17.
//  Copyright © 2017 Bluecrunch. All rights reserved.
//

import UIKit

extension Date {
    

    
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        return dateFormatter.string(from: self)
    }
    
}
