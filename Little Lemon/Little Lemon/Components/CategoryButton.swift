//
//  CategoryButton.swift
//  Little Lemon
//
//  Created by luther on 2023/07/23.
//

import SwiftUI

struct CategoryButton: View {
    var category = ""
    var body: some View {
        Button(category) {}
            .foregroundColor(Color("Primary1"))
            .padding()
            .background(Color("Secondary2"))
            .cornerRadius(20)
    }
}

struct CategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        CategoryButton()
    }
}
