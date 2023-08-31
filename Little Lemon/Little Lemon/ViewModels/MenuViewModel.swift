//
//  MenuViewModel.swift
//  Little Lemon
//
//  Created by luther on 2023/07/20.
//

import Foundation

class MenuViewModel: ObservableObject {
    let controller = DataController()
    @Published var dishes: [Dish] = []
    
    init() {
        controller.clear()
        getMenuData()
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
                        let newDish = Dish(context: self.controller.viewContext)
                        newDish.tittle = menuItem.title
                        newDish.image = menuItem.image
                        newDish.price = menuItem.price
                        newDish.dishDescription = menuItem.description
                        newDish.category = menuItem.category
                    }
                    try? self.controller.viewContext.save()
                } catch {
                    print("There was an error \(error)")
                }
            }
        }
        task.resume()
    }
    
    func getDishes() {
        dishes = controller.getDishes()
    }
}
