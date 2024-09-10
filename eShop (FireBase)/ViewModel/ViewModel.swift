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
    
    
    
    //MARK: - Universal unified method
    func updateItem (_ product: Product, data: [String:Any] ){
        guard let id = product.id else {return}
        db.document(id).updateData(data)
    }
    
    //MARK:  Methods
    func toggleFavorite(product: Product) {
        updateItem(product, data: ["isFavorite": !product.isFavorite])
    }
    
    func addToCart(product: Product) {
        updateItem(product, data: ["quantityInCart": (product.quantityInCart ?? 0)+1])
        updateItem(product, data: ["quantity": product.quantity - 1])
    }
    
    
    func addWithPlusInCart(product: Product) {
        updateItem(product, data: ["quantityInCart": (product.quantityInCart ?? 0)+1])
        updateItem(product, data: ["quantity": product.quantity - 1])
    }
    
    func removeWithMinusInCart(product: Product) {
        updateItem(product, data: ["quantityInCart": (product.quantityInCart ?? 0)-1])
        updateItem(product, data: ["quantity": product.quantity + 1])
    }
    
    func removeProductFromCart(product: Product) {
        updateItem(product, data: ["quantityInCart": (product.quantityInCart ?? 0)])
        updateItem(product, data: ["quantity": product.quantity])
    }
}

