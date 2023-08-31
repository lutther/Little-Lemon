//
//  Home.swift
//  Little Lemon
//
//  Created by luther on 2023/07/10.
//

import SwiftUI

struct Home: View {
    
    var body: some View {
        TabView {
            Menu()
                .tabItem({
                    Label("Menu", systemImage: "list.dash")
                })
            
            UserProfile()
                .tabItem({
                    Label("Profile", systemImage: "square.and.pencil")
                })
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
