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
    
    //MARK: - Methods
    func toggleFavorite(product: Product) {
        guard let id = product.id else { return }
        db.document(id).updateData(["isFavorite": !product.isFavorite])
    }
    
}

//#Preview {
//    ViewModel()
//}
