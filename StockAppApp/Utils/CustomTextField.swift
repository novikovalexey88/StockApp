//
//  CustomTextField.swift
//  StockAppApp
//
//  Created by 668 on 19.02.2022.
//

import SwiftUI

struct CustomTextField: View {
    
    var placeholder: Text
    
    @Binding var text: String
    
    var editingChanged: (Bool) -> Void = { _ in }
    
    var comit: () -> Void = {}
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: comit)
        }
    }
}
