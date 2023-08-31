//
//  ContentView.swift
//  Little Lemon
//
//  Created by luther on 2023/07/09.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext


    var body: some View {
        Onboarding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
