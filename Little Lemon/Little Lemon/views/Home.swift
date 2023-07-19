//
//  Home.swift
//  Little Lemon
//
//  Created by luther on 2023/07/10.
//

import SwiftUI

struct Home: View {
    let persistence = PersistenceController.shared
    
    var body: some View {
        TabView {
            Menu()
                .tabItem({
                    Label("Menu", systemImage: "list.dash")
                })
            
            UserProfile()
                .environment(\.managedObjectContext, persistence.container.viewContext)
                .tabItem({
                    Label("Profile", systemImage: "square.and.pencil")
                })
        }
        .onAppear {
            persistence.clear()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
