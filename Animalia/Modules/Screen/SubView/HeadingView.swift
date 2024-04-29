//
//  HeadingView.swift
//  Animalia
//
//  Created by MacBook Pro on 29/04/24.
//

import SwiftUI

struct HeadingView: View {
    var headingImage: String
    var headingtext: String
    
    var body: some View {
        HStack{
            Image(systemName: headingImage)
                .foregroundStyle(.accent)
                .imageScale(.large)
            
            Text(headingtext)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical, 16)
    }
}

#Preview {
    HeadingView(headingImage: "photo.on.rectangle.angled", headingtext: "Wilderness in Pictures")
}
