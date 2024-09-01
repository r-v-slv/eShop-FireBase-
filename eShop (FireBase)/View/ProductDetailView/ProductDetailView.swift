//
//  ProductDetailView.swift
//  eShop (FireBase)
//
//  Created by SLV on 25.08.2024.
//

import SwiftUI

struct ProductDetailView: View {
    
    @EnvironmentObject var vm: ViewModel
    var product: Product
    
    var body: some View {
        VStack {
            ZStack (alignment: .topLeading) {
                
                if let url = URL(string: product.image) {
                    ProductImageView(url: url, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.7)
                        .ignoresSafeArea()
                    .shadow(color: .primary.opacity(0.3), radius: 10, x: 0, y: 8)}
                
                
                HStack {
                    BackButtonView()
                        .padding(.leading)
                    
                    
                    Spacer()
                    
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
                }
            }
            
            
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
                    } label: {
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
                
            }.padding(.horizontal, 20)
                .foregroundColor(.primary)
            
        }
        .background(.primary.opacity(0.09))
        .foregroundColor(.primary)
        .ignoresSafeArea(edges: .bottom)
        .navigationBarBackButtonHidden()
    }
}

//#Preview {
//    ProductDetailView(
//        product: Product(
//            name: "Apple Watch Series 9",
//            description: "The rugged 49mm titanium case comes with built-in GPS + Cellular connectivity and pairs with specialized, high-performance bands. itanium case comes with built-in GPS + Cellular connectivity and pairs with specialized, high-performance bands. The rugged 49mm titThe rugged 49mce bands. The rugged 49mm titanium case comes with built-in GPS + Cellular connectivity and pairs with specialized, high-performance bands",
//            image:
//                "https://firebasestorage.googleapis.com/v0/b/eshop-firebase-9d4cd.appspot.com/o/eShop%2Fstore-card-40-ipad-air-202405.jpeg?alt=media&token=5783ab9e-d36c-4b89-b680-a65bf06cd7d4",
//            price: 999,
//            quantity: 5,
//            isFavorite: false,
//            quantityInCart: 0
//        )
//    )
//    .environmentObject(ViewModel())
//}
