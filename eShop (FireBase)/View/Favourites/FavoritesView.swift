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
    @EnvironmentObject var vm: ViewModel
    @FirestoreQuery(collectionPath: "eShopDB", predicates: [.isEqualTo("isFavorite", true)]) private var favoriteItems: [Product]
    var columns = Array(repeating: GridItem(), count: 2)

    
    
    
    //MARK: - Body
    var body: some View {
        ZStack (alignment: .topLeading) {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(favoriteItems) { item in
                        NavigationLink(destination: ProductDetailView(product: item)) {
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
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    BackButtonView()
                }
            }
            
        }
        .background(.primary.opacity(0.09))
        .foregroundColor(.primary)
        .ignoresSafeArea(edges: .bottom)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    FavoritesView()
        .environmentObject(ViewModel())
}
