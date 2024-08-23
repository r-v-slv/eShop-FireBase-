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
    
    
    //MARK: Body
    var body: some View {
        List {
            ForEach(items) { item in
                HStack {
                    Text(item.name)
                    Text("- \(item.price)")
                        .font(.caption)
                        
                }
                
            }
        }
            
    }
}

#Preview {
    MainView()
}
