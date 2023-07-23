//
//  UserProfile.swift
//  Little Lemon
//
//  Created by luther on 2023/07/10.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    let firstName = UserDefaults.standard.string(forKey: kfirstName) ?? ""
    let lastName = UserDefaults.standard.string(forKey: klastName) ?? ""
    let email = UserDefaults.standard.string(forKey: kemail) ?? ""
    
    var body: some View {
        VStack() {
            HStack {
                Text("Personal information")
                    .font(.title2)
                .fontWeight(.bold)
                Spacer()
            }
            HStack {
                Image("avatar")
                    .resizable()
                    .frame(width: 100, height: 100)
                .cornerRadius(50)
                Spacer()
            }
            
            HStack {
                VStack {
                    Text(firstName)
                        .padding()
                    Text(lastName)
                        .padding()
                    Text(email)
                        .padding()
                }
                Spacer()
            }
            
            Spacer()
            
            Button {
                UserDefaults.standard.set(false, forKey: kisLogenIn)
                self.presentation.wrappedValue.dismiss()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color("Primary2"))
                    Text("Log out")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                }
                .frame(height: 50)
            }
            .padding()
            
            
        }
        .padding()
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
