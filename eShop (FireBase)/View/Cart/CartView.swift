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

    
    
    
    
    //MARK: - Body
    var body: some View {
        VStack {
            ScrollView (.vertical, showsIndicators: false) {
                ForEach(inCartItems){ item in
                    ProductCardInCartView(product: item)
                }
                
                Spacer()
                
                Text("Total: ... ")
                    .padding(25)
                
                
                Button {
                    vm.addToCart(product: inCartItems[0]) //TO DELETE AND ADD A CORRECT FUNC
                }
                label: {
                    Text("Buy")
                }
                .frame(maxWidth: .infinity)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .background(.black)
                .clipShape(Capsule())
                .shadow(color: .primary.opacity(0.3),radius: 9 )
                
                
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
