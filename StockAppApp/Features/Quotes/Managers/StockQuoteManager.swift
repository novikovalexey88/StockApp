//
//  StockQuoteManager.swift
//  StockAppApp
//
//  Created by 668 on 19.02.2022.
//

import Foundation

final class StockQuoteManager: QuoteManagerProtocol, ObservableObject {
    @Published var quotes: [Quote] = []
    
    func download(stocks: [String], completion: @escaping (Result<[Quote], NetworkError>) -> Void) {
        var internalQuetes = [Quote]()
        let downloadQueue = DispatchQueue(label: "com.devtechie.downloadQueue")
        let downloadGroup = DispatchGroup()
        
        stocks.forEach { (stock) in
            downloadGroup.enter()
            let url = URL(string: API.quoteURL(for: stock))!
            NetworkManager<GlobalQuoteResponse>().fetch(from: url) { (result) in
                switch result {
                case .failure(let err):
                    print(err)
                    downloadQueue.async {
                        downloadGroup.leave()
                    }
                case .success(let resp):
                    downloadQueue.async {
                        internalQuetes.append(resp.quote)
                        downloadGroup.leave()
                    }
                }
            }
            
        }
        downloadGroup.notify(queue: DispatchQueue.global()) {completion(.success(internalQuetes))}
        DispatchQueue.main.async {
            self.quotes.append(contentsOf: internalQuetes)
        }
    }
}
