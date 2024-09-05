//
//  ViewModel.swift
//  eShop (FireBase)
//
//  Created by SLV on 25.08.2024.
//

import SwiftUI
import FirebaseFirestore

final class ViewModel: ObservableObject {
    
    //MARK: - Properties
    private let db = Firestore.firestore().collection("eShopDB")
//    var product: Product
    
    //MARK: - Methods
    func toggleFavorite(product: Product) {
        guard let id = product.id else { return }
        db.document(id).updateData(["isFavorite": !product.isFavorite])
    }
    
    func addToCart(product: Product) {
        guard let id = product.id else { return }
        db.document(id).updateData(["quantityInCart": (product.quantityInCart ?? 0)+1])
        db.document(id).updateData(["quantity": product.quantity - 1])
    }
    
    
    func addWithPlusInCart(product: Product) {
        guard let id = product.id else { return }
        db.document(id).updateData(["quantityInCart": (product.quantityInCart ?? 0)+1])
        db.document(id).updateData(["quantity": product.quantity - 1])
    }
    
    func removeWithMinusInCart(product: Product) {
        guard let id = product.id else { return }
        db.document(id).updateData(["quantityInCart": (product.quantityInCart ?? 0)-1])
        db.document(id).updateData(["quantity": product.quantity + 1])
    }
    
    func removeProductFromCart(product: Product) {
        guard let id = product.id else { return }
        db.document(id).updateData(["quantityInCart": (product.quantityInCart ?? 0)])
        db.document(id).updateData(["quantity": product.quantity])
    }

}

//#Preview {
//    ViewModel()
//}
