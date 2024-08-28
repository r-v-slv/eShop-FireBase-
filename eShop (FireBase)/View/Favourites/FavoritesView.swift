//
//  FavouritesView.swift
//  eShop (FireBase)
//
//  Created by SLV on 24.08.2024.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift


struct FavoritesView: View {
    
    //MARK: - Properties
    @FirestoreQuery(collectionPath: "eShopDB", predicates: [.isEqualTo("isFavorite", true)]) private var favoriteItems: [Product]
    var columns = Array(repeating: GridItem(), count: 2)
    
    //MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(favoriteItems) { item in
                    NavigationLink(destination: EmptyView()) {
                        ProductCardView(product: item)
                    }
                    .buttonStyle(.plain)
                    
                }
            }
        }
        .padding(10)
        .background(.secondary.opacity(0.04))
        .navigationTitle("Favourites")
        .shadow(color: .primary.opacity(0.25),radius: 9 )
    }
}

#Preview {
    FavoritesView()
}
