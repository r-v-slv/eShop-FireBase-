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
            ZStack{
                Circle()
                    .frame(width: 34)
                    .foregroundStyle(.gray.opacity(0.75))
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .foregroundStyle(.white)
                    .fontWeight(.medium)
                    .opacity(0.8)
            }
        })
    }
}

