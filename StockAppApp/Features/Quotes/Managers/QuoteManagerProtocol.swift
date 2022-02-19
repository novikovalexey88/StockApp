//
//  QuoteManagerProtocol.swift
//  StockAppApp
//
//  Created by 668 on 19.02.2022.
//

import Foundation

protocol QuoteManagerProtocol {
    var quotes: [Quote] { get set }
    func download(stocks: [String], completion: @escaping (Result<[Quote], NetworkError>) -> Void)
}
