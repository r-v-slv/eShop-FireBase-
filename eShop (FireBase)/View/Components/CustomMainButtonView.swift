//
//  CustomMainButtonView.swift
//  eShop (FireBase)
//
//  Created by SLV on 07.09.2024.
//

import SwiftUI

struct CustomMainButtonView: View {
    
    
    //MARK: - Properties
    let title: String
    let disabledButton: Bool
    let ishiddenButton: Bool
    let action: () -> ()
    
    
    //MARK: - Body
    var body: some View {
        Button {
           action()
        }
        label: {
            Text(title)
        }
        .frame(maxWidth: .infinity)
        .fontWeight(.bold)
        .foregroundColor(.white)
        .padding()
        .background(.black)
        .clipShape(Capsule())
        .shadow(color: .primary.opacity(0.3),radius: 9 )
        .disabled(disabledButton)
        .opacity(ishiddenButton ? 1 : 0)
    }
}


