//
//  InfoProductDetailView.swift
//  eShop (FireBase)
//
//  Created by SLV on 03.09.2024.
//

import SwiftUI

struct InfoProductDetailView: View {
    
    @EnvironmentObject var vm: ViewModel
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(product.name)
                .extraLargeTitleFont()
            
            HStack {
                Text("Price: $\(product.price)")
                    .titleFont()
                Spacer()
                if product.quantity > 0 {
                    Text("Available: \(product.quantity)")
                        .titleFont()
                } else {
                    Text("Not available")
                        .titleFont()
                        .foregroundColor(.red)
                        .opacity(0.5)
                }
            }
            
            Text(product.description)
                .subTitleFont()
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(6)
            
            Spacer()
            if product.quantity > 0 {
                Button {
                    vm.addToCart(product: product)
                }
                label: {
                    Text("Add to cart")
                }
                .frame(maxWidth: .infinity)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .background(.black)
                .clipShape(Capsule())
                .shadow(color: .primary.opacity(0.3),radius: 9 )
                .disabled(product.quantity == 0)
            }  else {
                Text("Please subscribe to be informed on availability")
                    .subTitleFont()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.secondary)
                    .opacity(0.75)
                    .padding()
                    .clipShape(Capsule())
            }
            
            Spacer()
            
        }
        .padding(.horizontal, 20)
        .foregroundColor(.primary)
    }
}

