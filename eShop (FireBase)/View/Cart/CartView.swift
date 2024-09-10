//
//  CartView.swift
//  eShop (FireBase)
//
//  Created by SLV on 24.08.2024.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct CartView: View {
    
    //MARK: - Properties
    @EnvironmentObject var vm: ViewModel
    @FirestoreQuery(collectionPath: "eShopDB", predicates: [.isGreaterThan("quantityInCart", 0)]) private var inCartItems: [Product]
    //  var productsInCart = ProductsCollection(elements: [(item.id)!: item.quantity]);
    
    
    //MARK: - Body
    var body: some View {
        VStack {
            ScrollView (.vertical, showsIndicators: false) {
                ForEach(inCartItems){ item in
                    ProductCardInCartView(product: item)
                }
            }
            
            Spacer()
            
            if inCartItems.count != 0 {
                Text("Total: ... ")
                    .padding(10)
                
                
            } else {
                Text("Cart is empty")
                    .extraLargeTitleFont()
                    .padding(UIScreen.main.bounds.height * 0.1)
            }
            
            
            CustomMainButtonView(title: "Buy", disabledButton: false, ishiddenButton: (inCartItems.count != 0)) {
                vm.addToCart(product: inCartItems[0])
            }
            
        }
        .padding(.horizontal, 10)
        .navigationTitle("Cart")
        .navigationBarBackButtonHidden()
        .background(.primary.opacity(0.09))
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButtonView()
            }
        }
    }
}



//#Preview {
//    CartView()
//}
