//
//  Onboarding.swift
//  Little Lemon
//
//  Created by luther on 2023/07/10.
//

import SwiftUI

let kfirstName = ""
let klastName = ""
let kemail = ""
let kisLogenIn = "kisLogedIn"

struct Onboarding: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Home().navigationBarBackButtonHidden(true), isActive: $isLoggedIn) {
                    EmptyView()
                }
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Email", text: $email)
                Button("Resgister") {
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                        UserDefaults.standard.set(firstName, forKey: kfirstName)
                        UserDefaults.standard.set(lastName, forKey: klastName)
                        UserDefaults.standard.set(email, forKey: kemail)
                        UserDefaults.standard.set(true, forKey: kisLogenIn)
                        
                        isLoggedIn = true
                    }
                }
            }
            .onAppear {
                if UserDefaults.standard.bool(forKey: kisLogenIn) {
                    isLoggedIn = true
                }
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
