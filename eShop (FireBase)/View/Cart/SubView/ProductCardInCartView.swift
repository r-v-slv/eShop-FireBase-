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
                        ProductImageView(url: url, width: size.width/4, height: size.height/2)
                    }
                    
                    Spacer()
                    
                    VStack (alignment: .trailing) {
                        HStack(content: {
                            VStack  {
                                Text(product.name)
                                    .titleFont()
                                    .lineLimit(1)
                                    .foregroundColor(.primary)
                                
                                Text("$\(product.price * (product.quantityInCart ?? 1))")
                                    .subTitleFont()
                                    .lineLimit(1)
                                    .foregroundColor(.primary)
                            }
                            .padding(10)
                            
                            Spacer()
                            
                            Button(action: {
                                vm.removeProductFromCart(product: product)
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
                        })
                       
                        Spacer()
                     
                        
                        HStack {
 
//                            Spacer()
                            
                            Button (action: {
                                vm.addWithPlusInCart(product: product)
                            }, label: {
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
                            })
                            .buttonStyle(.plain)
                            .disabled(product.quantity == 0)
                            
                            
                            
                            Text("\(product.quantityInCart ?? 0)")
                                .foregroundStyle(.white)
                            
                            
                            
                            Button(action: {
                                vm.removeWithMinusInCart(product: product)
                            }, label: {
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
                            })
                            .buttonStyle(.plain)
                            .disabled(product.quantity == product.quantityInCart)
                        }
                    }
                }
                .padding()
                .background(.primary.opacity(0.04))
                .cornerRadius(15)
            
        }
        .frame(height: UIScreen.main.bounds.width * 0.5)
        
    }
}


//#Preview {
//    ProductCardInCartView(
//        product: Product(
//            name: "Apple Watch Series 9",
//            description: "WatchWatchWatchWatchWatchWatch",
//            image:
//                "https://firebasestorage.googleapis.com/v0/b/eshop-firebase-9d4cd.appspot.com/o/eShop%2Fstore-card-40-ipad-air-202405.jpeg?alt=media&token=5783ab9e-d36c-4b89-b680-a65bf06cd7d4",
//            price: 999,
//            quantity: 5,
//            isFavorite: false,
//            quantityInCart: 2
//        )
//    )
//    .environmentObject(ViewModel())
//}
