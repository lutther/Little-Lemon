//
//  Menu.swift
//  Little Lemon
//
//  Created by luther on 2023/07/10.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack {
            Text("Little Lemon")
            Text("Chicago")
            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
            List {
                
            }
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
