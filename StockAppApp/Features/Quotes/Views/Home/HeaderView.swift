//
//  HeaderView.swift
//  StockAppApp
//
//  Created by 668 on 19.02.2022.
//

import SwiftUI

struct HeaderView: View {
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd"
        return formatter
    } ()
    
    @Binding var stocks: [String]
    
    @State private var showSerch = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: -5) {
                Text("Stocks")
                    .foregroundColor(.blue)
                    .bold()
                
                
                Text("\(Date(), formatter: dateFormatter)")
                    .foregroundColor(.gray)
                    .bold()
            }.font(.title)
            
            Spacer()
            
            Button(action: {
                showSerch.toggle()
            }, label: {
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.white)
            }
            
            ).sheet(isPresented: $showSerch, onDismiss: {}, content: {
                Text("Serch view will go there")
            })
            
            
        }
       
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(stocks: .constant(["AAPL", "GOOG"]))
    }
}
