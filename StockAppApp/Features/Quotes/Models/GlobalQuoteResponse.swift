//
//  GlobalQuoteResponce.swift
//  StockAppApp
//
//  Created by 668 on 19.02.2022.
//

import Foundation

struct GlobalQuoteResponse: Codable {
    var quote: String
    
    private enum CodingKeys: String, CodingKeys {
        case quote = "Global Quote"
    }
}
