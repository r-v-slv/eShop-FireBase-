//
//  ProductView.swift
//  eShop (FireBase)
//
//  Created by SLV on 23.08.2024.
//

import SwiftUI

struct CardView: View {
    
    //MARK: - Properties
    @EnvironmentObject var vm: ViewModel
    let product: Product
    
    
    //MARK: - Body
    var body: some View {
        GeometryReader { geo in
            let size = geo.size
            
            ZStack (alignment: .bottom) {
                ZStack(alignment: .topTrailing, content: {
                    if let url = URL(string: product.image) {
                        ProductImageView(url: url, width: size.width, height: size.height)
                    }
                    
                    //MARK:  Favourite button on productCard
                    Button(action: {
                        vm.toggleFavorite(product: product)
                    }, label: {
                        Image(systemName: "heart.fill")
                            .padding(10)
                            .foregroundColor(product.isFavorite ? .red : .white)
                            .background(.gray)
                            .clipShape(Circle()).opacity(0.75)
                            .padding(10)
                    })
                    
                })
                
                VStack (alignment: .leading) {
                    Text(product.name)
                        .titleFont()
                        .lineLimit(1)
                    
                    Text("$\(product.price)")
                        .subTitleFont()
                        .lineLimit(1)
                }
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.opacity(0.5))
                .cornerRadius(12)
                .padding(10)
                
            }
            
            
        }
        .frame(height: UIScreen.main.bounds.width * 0.6)
        
    }
}

#Preview {
    CardView(
        product: Product(
            name: "Apple Watch Series 9",
            description: "WatchWatchWatchWatchWatchWatch",
            image:
                "https://firebasestorage.googleapis.com/v0/b/eshop-firebase-9d4cd.appspot.com/o/eShop%2Fstore-card-40-ipad-air-202405.jpeg?alt=media&token=5783ab9e-d36c-4b89-b680-a65bf06cd7d4",
            price: 999,
            quantity: 5,
            isFavorite: false
        )
    )
    .environmentObject(ViewModel())
}
