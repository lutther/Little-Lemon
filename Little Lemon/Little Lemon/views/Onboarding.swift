//
//  Onboarding.swift
//  Little Lemon
//
//  Created by luther on 2023/07/10.
//

import SwiftUI

let kfirstName = "kfirstName"
let klastName = "klastName"
let kemail = "kemail"
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
                
                Image("Logo")
                
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Little Lemon")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color("Primary2"))
                            Text("Location")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                                .padding()
                        }
                        Spacer()
                        Image("Heroimage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(20)
                            .frame(width: 100, height: 200)
                    }
                    .padding()
                }
                .background(Color("Primary1"))
                
                VStack {
                    TextField("First Name", text: $firstName)
                        .padding(.vertical)
                        .textFieldStyle(.roundedBorder)
                    TextField("Last Name", text: $lastName)
                        .padding(.vertical)
                        .textFieldStyle(.roundedBorder)
                    TextField("Email", text: $email)
                        .padding(.vertical)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                    
                    Button {
                        if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                            UserDefaults.standard.set(firstName, forKey: kfirstName)
                            UserDefaults.standard.set(lastName, forKey: klastName)
                            UserDefaults.standard.set(email, forKey: kemail)
                            UserDefaults.standard.set(true, forKey: kisLogenIn)
                            
                            isLoggedIn = true
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color("Primary2"))
                            Text("Register")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                        }
                        .frame(height: 50)
                    }
                }
                .padding()
                Spacer()
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
