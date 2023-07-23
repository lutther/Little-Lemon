//
//  MenuBreakdown.swift
//  Little Lemon
//
//  Created by luther on 2023/07/22.
//

import SwiftUI

struct MenuBreakdown: View {
//    let dishes: [Dish]
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("ORDER FOR DELIVERY!")
                    .font(.title)
                    .fontWeight(.bold)
                HStack {
                    CategoryButton(category: "Staters")
                    CategoryButton(category: "Mains")
                    CategoryButton(category: "Desserts")
                    CategoryButton(category: "Drinks")
                }
            }
        }
    }
}

struct MenuBreakdown_Previews: PreviewProvider {
    static var previews: some View {
        MenuBreakdown()
    }
}
