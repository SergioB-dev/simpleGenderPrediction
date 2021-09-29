//
//  GenderQuery.swift
//  SImpleJSON
//
//  Created by Sergio Bost on 9/29/21.
//

import Foundation

struct GenderProb: Codable {
    let name: String
    let gender: String
    let probability: Double
    let count: Int
    
}


extension GenderProb {
    func statistics() -> String {
        return "\(name) is \(String(format: "%.2f", probability)) likely to be a \(gender)."
    }
}
