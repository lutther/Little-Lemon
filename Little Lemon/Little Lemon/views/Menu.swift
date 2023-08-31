//
//  Menu.swift
//  Little Lemon
//
//  Created by luther on 2023/07/10.
//

import SwiftUI

struct Menu: View {
    @StateObject var viewModel = MenuViewModel()
    @State var searchText = ""
    
    
    var body: some View {
        VStack {
            NavigationBar()
            HeroSection(searchText: $searchText)
            MenuBreakdown()
            
            List {
                ForEach(viewModel.dishes) { dish in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(dish.tittle!)")
                                .fontWeight(.bold)
                            Text("\(dish.dishDescription!)")
                                .foregroundColor(Color("Primary1"))
                                .lineLimit(2)
                            Text("$\(dish.price!)")
                                .foregroundColor(Color("Primary1"))
                                .fontWeight(.bold)
                            
                        }
                        Spacer()
                        AsyncImage(url: URL(string: dish.image!)) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: 50, height: 50)
                    }
                }
            }
        }
        .onAppear {
            viewModel.getDishes()
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
