//
//  MainView.swift
//  eShop (FireBase)
//
//  Created by SLV on 20.08.2024.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct MainView: View {
    
    //MARK: Properties
    @FirestoreQuery(collectionPath: "eShopDB") var items: [Product]
    var columns = Array(repeating: GridItem(), count: 2)
    
    //MARK: Body
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns ) {
                    ForEach(items) { item in
                        ProductCardView(product: item)
                    }
                }
            }
            
            //MARK: NavigationBar
            .navigationTitle("Products")
            .toolbar {
                //MARK: Favourites
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: FavouritesView()) {
                        Image(systemName: "heart.fill")
                            .font(.title2)
                    }
                    .buttonStyle(.plain)
                }
                //MARK: Cart
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: CartView()) {
                        Image(systemName: "cart.fill")
                            .font(.title2)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

#Preview {
    MainView()
}
