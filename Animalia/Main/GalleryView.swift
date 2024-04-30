//
//  GalleryView.swift
//  Animalia
//
//  Created by MacBook Pro on 30/04/24.
//

import SwiftUI

struct GalleryView: View {
    @State private var selectedAnimal: String = "lion"
    @State private var gridCoolumn: Double = 3.0
    
    // MARK: - FUNCTION GRID SWITCH
    func gridSwitch() {
        withAnimation(.easeIn) {
            gridLayout = Array(repeating: .init(.flexible()), count: Int(gridCoolumn))
        }
    }
    
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .heavy)
    
    // SIMPLE GRID DEFINTION
//    let gridLayout: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//    ]
    
    // EFFICIENT GRID DEFINITION
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // DYNAMIC GRID LAYOUT
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 32) {
                // MARK: - SELECTED IMAGE ANIMAL
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                // MARK: - SLIDER GRID SWITCH
                Slider(value: $gridCoolumn, in: 2...4, step: 1)
                    .padding()
                    .onChange(of: gridCoolumn) { oldValue, newValue in
                        gridSwitch()
                    }
                
                // MARK: - GRID
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    }
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
            .onAppear {
                gridSwitch()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

#Preview {
    GalleryView()
}
