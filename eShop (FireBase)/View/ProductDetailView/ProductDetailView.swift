//
//  ProductDetailView.swift
//  eShop (FireBase)
//
//  Created by SLV on 25.08.2024.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: Product
    
    var body: some View {
        VStack {
            if let url = URL(string: product.image) {
                ProductImageView(url: url, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.7)
                    .ignoresSafeArea()
                    .shadow(color: .black.opacity(0.25), radius: 10, x: 0, y: 8)
            }
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text(product.name)
                        .titleFont()
                    Spacer()
                    Text("$\(product.price)")
                        .titleFont()
                }
                
                Text(product.description)
                    .subTitleFont()
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(6)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Add to cart")
                }
                .frame(maxWidth: .infinity)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .background(.black)
                .clipShape(Capsule())
                .shadow(radius: 9)
                
                Spacer()
                
            }.padding(.horizontal, 20)
            
                
        }
        .background(.secondary.opacity(0.04))
        
    }
}

#Preview {
    ProductDetailView(
        product: Product(
            name: "Apple Watch Series 9",
            description: "The rugged 49mm titanium case comes with built-in GPS + Cellular connectivity and pairs with specialized, high-performance bands. itanium case comes with built-in GPS + Cellular connectivity and pairs with specialized, high-performance bands. The rugged 49mm titThe rugged 49mce bands. The rugged 49mm titanium case comes with built-in GPS + Cellular connectivity and pairs with specialized, high-performance bands",
            image:
                "https://firebasestorage.googleapis.com/v0/b/eshop-firebase-9d4cd.appspot.com/o/eShop%2Fstore-card-40-ipad-air-202405.jpeg?alt=media&token=5783ab9e-d36c-4b89-b680-a65bf06cd7d4",
            price: 999,
            quantity: 5,
            isFavorite: false
        )
    )
    .environmentObject(ViewModel())
}
