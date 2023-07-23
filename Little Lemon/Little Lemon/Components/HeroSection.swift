//
//  HeroSection.swift
//  Little Lemon
//
//  Created by luther on 2023/07/21.
//

import SwiftUI

struct HeroSection: View {
    @Binding var searchText: String
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Little Lemon")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Primary2"))
                    Text("Chicago")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.top)
                }
                Spacer()
                Image("Heroimage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .frame(width: 100, height: 200)
            }
            .padding()
            
            TextField("Search menu...", text: $searchText)
                .background(.white)
                .padding()
                .textFieldStyle(.roundedBorder)
        }
        .background(Color("Primary1"))
    }
}

struct HeroSection_Previews: PreviewProvider {
    @State static var searchText = ""
    static var previews: some View {
        HeroSection(searchText: $searchText)
    }
}
