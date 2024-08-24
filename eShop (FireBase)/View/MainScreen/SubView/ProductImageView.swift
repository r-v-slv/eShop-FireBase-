//
//  ProductImageView.swift
//  eShop (FireBase)
//
//  Created by SLV on 24.08.2024.
//

import SwiftUI

struct ProductImageView: View {
    
    //MARK: - Properties
    let url: URL
    let width: CGFloat
    let height: CGFloat
    
    //MARK: - Body
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                //.scaledToFit()
                .frame(width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        } placeholder: {
            ProgressView()
                .frame(width: width, height: height)
        }
    }
}



