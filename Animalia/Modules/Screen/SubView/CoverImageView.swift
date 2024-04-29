//
//  CoverImageView.swift
//  Animalia
//
//  Created by MacBook Pro on 29/04/24.
//

import SwiftUI

struct CoverImageView: View {
    
    let coverImages: [CoverImageModel] =  Bundle.main.decode("covers.json")
    
    @State private var showingSheet = false
    @State private var selectedCover: CoverImageModel?
    
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
                    .onTapGesture {
                    showingSheet.toggle()
                    selectedCover = item
                }
            }
            .sheet(isPresented: $showingSheet) {
                if let selectedCover = selectedCover {
                    OctagonImageFrame(cover: selectedCover)
                        .presentationDetents([.medium, .large])
                }
                    
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    CoverImageView()
}
