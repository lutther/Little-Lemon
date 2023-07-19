//
//  Menu.swift
//  Little Lemon
//
//  Created by luther on 2023/07/10.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var searchText = ""
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "tittle", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
    
    func buidPredicate() -> NSPredicate {
        if searchText.isEmpty {
            return NSPredicate(value: true)
        }
        return NSPredicate(format: "tittle CONTAINS[cd] %@", searchText)
    }
    
    func getMenuData() {
        guard let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json") else {
            return
        }
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let menuList = try decoder.decode(MenuList.self, from: data)
                    for menuItem in menuList.menu {
                        let newDish = Dish(context: viewContext)
                        newDish.tittle = menuItem.title
                        newDish.image = menuItem.image
                        newDish.price = menuItem.price
                    }
                    try? viewContext.save()
                } catch {
                    print("There was an error \(error)")
                }
            }
        }
        task.resume()
    }
    
    var body: some View {
        VStack {
            Text("Little Lemon")
            Text("Chicago")
            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
            TextField("Search menu", text: $searchText)
            
        FetchedObjects(predicate: buidPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
            List {
                ForEach(dishes) { dish in
                    HStack {
                        Text("\(dish.tittle!) - \(dish.price!)")
                        Spacer()
                        AsyncImage(url: URL(string: dish.image!))
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    }
                }
            }
        }
        }
        .onAppear {
            getMenuData()
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
