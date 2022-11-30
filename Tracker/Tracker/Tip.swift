//
//  Tip.swift
//  Tracker
//
//  Created by Dmitriy Rysev on 30.11.2022.
//

import Foundation

struct Tip: Decodable {
    let text: String
    let children: [Tip]?
    
}
