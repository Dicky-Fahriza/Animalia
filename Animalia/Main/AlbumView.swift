//
//  Album.swift
//  Animalia
//
//  Created by MacBook Pro on 30/04/24.
//

import SwiftUI
import PhotosUI

struct AlbumView: View {
    @State private var selectedItem: [PhotosPickerItem] = []
    @State private var selectedImages: [UIImage] = []
    
    var body: some View {
        VStack {
            // MARK: - DISPLAY SELECTED
            if selectedImages.isEmpty {
                ContentUnavailableView("No Photos", systemImage: "photo.on.rectangle", description: Text("To get started, selected some photos below."))
                    .frame(height: 300)
            } else {
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(selectedImages, id:  \.self) { image in
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 250)
                                .clipShape(RoundedRectangle(cornerRadius: 24))
                                .padding(.horizontal, 20)
                                .containerRelativeFrame(.horizontal)
                        }
                    }
                } //: SCROLLVIEW
                .frame(height: 300)
            }
            
            Spacer()
            
            
            // MARK: - PHOTOS PICKER
            PhotosPicker(selection: $selectedItem, maxSelectionCount: 5, selectionBehavior: .continuousAndOrdered, matching: .images) {
                Label("Selected a photo", systemImage: "photo")
            }
            .photosPickerStyle(.inline)
//            .photosPickerDisabledCapabilities(.selectionActions)
            .frame(height: 500)
            .ignoresSafeArea()
            .onChange(of: selectedItem) { oldItems, newItems in
                print("Old items: \(oldItems.count)")
                print("Old items: \(newItems.count)")
                selectedImages = []
                
                newItems.forEach { newItem in
                    Task {
                        if let data = try? await newItem.loadTransferable(type: Data.self)
                        {
                            if let image = UIImage(data: data) {
                                selectedImages.append(image)
                            }
                        }
                    }
                }
            }
        }//: VSTACK
        
        // SIMPLE IMPLEMENTATION
//        PhotosPicker(selection: $selectedItem, matching: .images) {
//            Label("Select a photo", systemImage: "photo")
//        }
    }
}

#Preview {
    AlbumView()
}
