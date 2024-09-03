//
//  ProductCardInCartView.swift
//  eShop (FireBase)
//
//  Created by SLV on 03.09.2024.
//

import SwiftUI

struct ProductCardInCartView: View {
    
    //MARK: - Properties
    @EnvironmentObject var vm: ViewModel
    let product: Product
    
    
    //MARK: - Body
    var body: some View {
        GeometryReader { geo in
            let size = geo.size
            
            
            HStack {
                
                if let url = URL(string: product.image) {
                    ProductImageView(url: url, width: size.width/2.5, height: size.height/2)
                }
                
                VStack (alignment: .trailing) {
                    Button(action: {
                        /////
                    }, label: {
                        ZStack{
                            Circle()
                                .frame(width: 20)
                                .foregroundStyle(.gray.opacity(0.75))
                            Image(systemName: "xmark")
                                .font(.footnote)
                                .foregroundStyle(.white)
                                .fontWeight(.medium)
                                .opacity(0.8)
                        }
                    })
                    
                    
                    HStack {
                        VStack  {
                            Text(product.name)
                                .titleFont()
                                .lineLimit(1)
                            
                            Text("$\(product.price)")
                                .subTitleFont()
                                .lineLimit(1)
                        }
                        .padding(10)
                        .frame(maxWidth: .infinity, alignment: .bottomLeading)
                        .background(.background.opacity(0.5))
                        .cornerRadius(12)
                        
                        
                        
                        
                        Button {
                            //
                        } label: {
                            ZStack{
                                Rectangle()
                                    .frame(width: 20, height: 20)
                                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                                    .foregroundStyle(.gray.opacity(0.75))
                                Image(systemName: "plus")
                                    .font(.footnote)
                                    .padding(5)
                                    .foregroundStyle(.white)
                                    .fontWeight(.medium)
                                    .opacity(0.8)
                            }
                        }
                        Button {
                            //
                        } label: {
                            ZStack{
                                Rectangle()
                                    .frame(width: 20, height: 20)
                                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                                    .foregroundStyle(.gray.opacity(0.75))
                                Image(systemName: "minus")
                                    .font(.footnote)
                                    .padding(5)
                                    .foregroundStyle(.white)
                                    .fontWeight(.medium)
                                    .opacity(0.8)
                            }
                        }
                    }
                }
            }
        }
        .frame(height: UIScreen.main.bounds.width * 0.6)
        
    }
}

#Preview {
    ProductCardInCartView(
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
