//
//  BackButtonView.swift
//  eShop (FireBase)
//
//  Created by SLV on 30.08.2024.
//

import SwiftUI


struct BackButtonView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button(action: {
            dismiss()
        }, label: {
            Image(systemName: "chevron.left")
                .padding(10)
                .foregroundStyle(.white)
                .background(.gray.opacity(0.5))
                .clipShape(Circle())
                .padding(10)
        })
    }
}

#Preview {
    BackButtonView()
}
