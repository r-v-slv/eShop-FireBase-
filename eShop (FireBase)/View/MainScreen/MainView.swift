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
    
    //MARK: - Properties
    @EnvironmentObject var vm: ViewModel
    @FirestoreQuery(collectionPath: "eShopDB") var items: [Product]
    var columns = Array(repeating: GridItem(), count: 2)
    
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns ) {
                    ForEach(items) { item in
                        NavigationLink(destination: ProductDetailView(product: item)) {
                            ProductCardView(product: item)
                        }
                        .buttonStyle(.plain)
                        .foregroundColor(.primary)
                    }
                }
            }
            .padding(.horizontal, 10)
            .background(.primary.opacity(0.09))
            .shadow(color: .primary.opacity(0.2), radius: 5)
            
            
            
            
            /// NavigationBar
            .navigationTitle("Products")
            .toolbar {
                /// Favourites
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: FavoritesView()) {
                        Image(systemName: "heart.fill")
                            .font(.title2)
                    }
                    .buttonStyle(.plain)
                }
                /// Cart
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: CartView()) {
                        Image(systemName: "cart.fill")
                            .font(.title2)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .accentColor(.gray)
        
    }
}


#Preview {
    MainView()
        .environmentObject(ViewModel())
}
