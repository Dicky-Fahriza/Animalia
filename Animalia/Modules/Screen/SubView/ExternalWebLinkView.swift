//
//  ExternalWebLinkView.swift
//  Animalia
//
//  Created by MacBook Pro on 29/04/24.
//

import SwiftUI

struct ExternalWebLinkView: View {
    let animal: AnimalModel
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                
                Spacer()
                
                Group {
                    let destination = URL(string: animal.link)
                    let wikipedia = URL(string: "wikipedia.org")!
                    
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: (destination ?? wikipedia))
                }
            }
        }
    }
}

#Preview {
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    return ExternalWebLinkView(animal: animals[9])
}
