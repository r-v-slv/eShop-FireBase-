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
                CustomMainButtonView(title: "Add to cart", disabledButton: (product.quantity == 0), ishiddenButton: true) {
                    vm.addToCart(product: product)
                }
            } else {
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

