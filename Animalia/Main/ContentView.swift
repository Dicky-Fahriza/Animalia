//
//  ContentView.swift
//  Animalia
//
//  Created by MacBook Pro on 29/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            CoverImageView()
                .frame(height: 300)
        }
        .navigationTitle("Animalia")
    }
}

#Preview {
    ContentView()
}
