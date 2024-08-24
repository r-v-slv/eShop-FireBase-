//
//  Extension+Text.swift
//  eShop (FireBase)
//
//  Created by SLV on 24.08.2024.
//

import SwiftUI

extension Text {
    func titleFont () -> some View {
        self
            .foregroundStyle(.primary)
            .font(.system(size:15, weight: .bold, design: .rounded))
            .opacity(0.8)
    }
    
    func subTitleFont () -> some View {
        self
        .foregroundStyle(.primary)
        .font(.system(size:12, weight: .bold, design: .rounded))
        .opacity(0.8)
    }
}

struct FontView: View {
    var body: some View {
        Text("Title font")
            .titleFont()
        
        Text("SubTitle font")
            .subTitleFont()
        
    }
}


#Preview {
    FontView()
}
