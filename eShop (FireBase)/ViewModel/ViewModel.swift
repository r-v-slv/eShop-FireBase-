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
        let currentQuantity = max((product.quantityInCart ?? 0)-1, 1)
        updateItem(product, data: ["quantityInCart": currentQuantity])
        updateItem(product, data: ["quantity": product.quantity + 1])
        
    }
    
    func removeProductFromCart(product: Product) {
        var quantity = product.quantity + (product.quantityInCart)!
        var quantityInCart = (product.quantityInCart)! - (product.quantityInCart)!
        updateItem(product, data: ["quantityInCart": quantityInCart])
        updateItem(product, data: ["quantity": quantity ])
    }
    
    
    func addToColection (){
        let pairs = ProductsCollection(["iPhone": 2, "iPad": 1, "iVision": 4])
        print(pairs.elements)
    }
}

