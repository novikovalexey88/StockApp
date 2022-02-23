//
//  QuoteCell.swift
//  StockAppApp
//
//  Created by 668 on 20.02.2022.
//

import SwiftUI

struct QuoteCell: View {
    
    var quote: Quote
    var body: some View {
        
        HStack {
            Text(quote.symbol)
                .font(.body)
                .bold()
            
            Spacer()
            
            Spacer()
            
            VStack {
                Text(quote.price)
                    .bold()
                Text(quote.change)
                    .padding(.horizontal)
                    .frame(width: 100)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Double(quote.change)! > 0.0 ? Color.green : Color.red), alignment: .trailing)
                
            }
        }
    }
}

struct QuoteCell_Previews: PreviewProvider {
    static var previews: some View {
        QuoteCell(quote: Quote(symbol: "APPL", open: "123", high: "345", low: "678", price: "910", change: "1", changePercent: "1%"))
    }
}
