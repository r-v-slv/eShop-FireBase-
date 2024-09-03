//
//  FavoritesButtonView.swift
//  eShop (FireBase)
//
//  Created by SLV on 03.09.2024.
//

import SwiftUI

struct FavoritesButtonView: View {
    
    //MARK: - Properties
    @EnvironmentObject var vm: ViewModel
    let product: Product
    
    var body: some View {
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


