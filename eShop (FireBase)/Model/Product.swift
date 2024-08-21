//
//  Product.swift
//  eShop (FireBase)
//
//  Created by SLV on 21.08.2024.
//

import Foundation
import FirebaseFirestoreSwift

struct Product: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var description: String
    var image: String
    var price: Int
    var quantity: Int
    var isFavorite: Bool
    var quantityInCart: Int?
    
    
    
}



