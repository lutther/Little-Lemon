//
//  MenuItem.swift
//  Little Lemon
//
//  Created by luther on 2023/07/17.
//

import Foundation
struct MenuItem: Decodable {
    let title: String
    let description: String
    let price: String
    let image: String
    let category: String
}
