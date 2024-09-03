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
    var columns = Array(repeating: GridItem(), count: 1)
    
    
    
    //MARK: - Body
    var body: some View {
        VStack {
            ScrollView (.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(inCartItems) { item in
                        ProductCardInCartView(product: item)
                    }
                }
                .padding(.horizontal, 10)
            }.navigationTitle("Cart")
                .navigationBarBackButtonHidden()
                .background(.secondary.opacity(0.04))
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        BackButtonView()
                    }
                }
        }
    }
}

#Preview {
    CartView()
}
