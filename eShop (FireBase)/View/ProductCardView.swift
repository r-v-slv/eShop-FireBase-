//
//  ProductView.swift
//  eShop (FireBase)
//
//  Created by SLV on 23.08.2024.
//

import SwiftUI

struct ProductCardView: View {
    
    let product: Product
        
    var body: some View {
        GeometryReader { geo in
            let size = geo.size
            
            ZStack(alignment: .topTrailing, content: {
                if let url = URL(string: product.image) {
                    ProductImageView(url: url, width: size.width, height: size.height)
                }
                
                
                Button(action: {
//                    product.isFavorite = true
                }, label: {
                    Image(systemName: "heart.fill")
                        .padding(7.5)
                        .foregroundColor(product.isFavorite ? .red : .white)
                        .background(.gray)
                        .clipShape(Circle()).opacity(0.8)
                        .padding(10)
                })

            })
                        
            
        }
        .frame(height: UIScreen.main.bounds.width * 0.6)
        .background(.background.opacity(0.5))
        .padding(10)
    }
}

#Preview {
    ProductCardView(
        product: Product(
            name: "Apple Watch Series 9",
            description: "WatchWatchWatchWatchWatchWatch",
            image:
                "https://firebasestorage.googleapis.com/v0/b/eshop-firebase-9d4cd.appspot.com/o/eShop%2Fstore-card-40-ipad-pro-202405.jpeg?alt=media&token=f7164721-17bd-4f95-8508-80af9f1d5b5b",
            price: 999,
            quantity: 5,
            isFavorite: false
        )
    )
}
